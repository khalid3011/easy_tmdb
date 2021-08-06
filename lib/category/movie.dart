import 'package:tmdb_easy/export/export_all.dart';

class Movie {
  //MOVIE images
  Future<MovieImage> image(int movieId) async {
    final response = await Utils.fetchData(UrlMaker.movieImage(movieId));
    return MovieImage.fromJson(json.decode(response.body));
  }

  //MOVIE credits
  Future<MovieCredits> credits(int movieId) async {
    final response = await Utils.fetchData(UrlMaker.movieCredits(movieId));

    return MovieCredits.fromJson(json.decode(response.body));
  }

  //MOVIE details
  Future<MovieDetails> details(int? movieId, {String? language}) async {
    final response =
        await Utils.fetchData(UrlMaker.movieDetails(movieId, language));

    return MovieDetails.fromJson(json.decode(response.body));
  }

  //MOVIE similar
  Future<MovieSimilar> similar(int movieId,
      {int page: 1, String? language, bool random: false}) async {
    var response =
        await Utils.fetchData(UrlMaker.movieSimilar(movieId, page, language));
    if (Utils.isValidResponse(response) && random) {
      int? page = Utils.randomBetween(
          MovieSimilar.fromJson(json.decode(response.body)).totalPages!);
      response =
          await Utils.fetchData(UrlMaker.movieSimilar(movieId, page, language));
    }

    return MovieSimilar.fromJson(json.decode(response.body));
  }

  //MOVIE top rated
  Future<MovieTopRated> topRated(
      {int page: 1, String? language, bool random: false}) async {
    var response =
        await Utils.fetchData(UrlMaker.movieTopRated(page, language));
    if (Utils.isValidResponse(response) && random) {
      int? page = Utils.randomBetween(
          MovieTopRated.fromJson(json.decode(response.body)).totalPages!);
      response = await Utils.fetchData(UrlMaker.movieTopRated(page, language));
    }

    return MovieTopRated.fromJson(json.decode(response.body));
  }

  //MOVIE popular
  Future<MoviePopular> popular(
      {int page: 1, String? language, bool random: false}) async {
    var response = await Utils.fetchData(UrlMaker.moviePopular(page, language));

    if (Utils.isValidResponse(response) && random) {
      int? page = Utils.randomBetween(
          MoviePopular.fromJson(json.decode(response.body)).totalPages!);
      response = await Utils.fetchData(UrlMaker.moviePopular(page, language));
    }

    return MoviePopular.fromJson(json.decode(response.body));
  }

  //MOVIE upcoming
  Future<MovieUpcoming> upcoming(
      {int page: 1, String? language, bool random: false}) async {
    var response =
        await Utils.fetchData(UrlMaker.movieUpcoming(page, language));
    if (Utils.isValidResponse(response) && random) {
      int? page = Utils.randomBetween(
          MovieUpcoming.fromJson(json.decode(response.body)).totalPages!);
      response = await Utils.fetchData(UrlMaker.movieUpcoming(page, language));
    }

    return MovieUpcoming.fromJson(json.decode(response.body));
  }

  //MOVIE latest
  Future<MovieLatest> latest({String? language, bool adult = false}) async {
    final response = await Utils.fetchData(UrlMaker.movieLatest(language));

    MovieLatest movie = MovieLatest.fromJson(json.decode(response.body));

    return adult
        ? movie
        : movie.adult!
            ? throw Exception("Latest Movie is Adult type")
            : Filter.containAdultWordList(movie.originalTitle)
                ? throw Exception("Latest Movie is Adult type")
                : movie;
  }

  ///read details in [detailsWithMore()]
  Future<List<MovieDetails>?> latestWithMore({
    bool? validImagePath,
    int? items,
  }) async {
    final response = await latest();
    List<MovieDetails>? _result;

    try {
      if (validImagePath == null && items == null) {
        _result = await detailsWithMore(response.id);
      } else if (validImagePath != null && items != null) {
        _result = await detailsWithMore(response.id,
            items: items, validImagePath: validImagePath);
      } else if (validImagePath != null) {
        _result =
            await detailsWithMore(response.id, validImagePath: validImagePath);
      } else if (items != null) {
        _result = await detailsWithMore(response.id, items: items);
      }
    } on Exception catch (error) {
      Utils.error(error);
    }

    return _result;
  }

  ///if you provide [items] the size of List<MovieDetails> same as [items]
  ///[items] is always decrement that means
  ///if your [items] is 3 and [startMovieId] is 100 then it will return 100 99 98.....
  ///if you want to increment then set false to [decrement]
  ///if you provide [endMovieId] then [items] and  [decrement] will not work
  ///if some id not found then it will ignore automatically
  Future<List<MovieDetails>> detailsWithMore(
    int? startMovieId, {
    String? language,
    int? endMovieId,
    int? items,
    bool validImagePath = false,
    bool decrement = true,
    bool adult = false,
  }) async {
    List<MovieDetails> _results = [];

    if (endMovieId != null) {
      //start > end
      if (startMovieId! < endMovieId) {
        int? temp = startMovieId;
        startMovieId = endMovieId;
        endMovieId = temp;
      }
    }
    int _currentMovieId = startMovieId!;

    while (true) {
      try {
        MovieDetails _details = await details(_currentMovieId);
        if (validImagePath) {
          if (Utils.validImagePath(_details.posterPath!) ||
              Utils.validImagePath(_details.backdropPath!)) {
            if (_details.adult == adult) _results.add(_details);
          }
        } else {
          _results.add(_details);
        }

        if (endMovieId == null && items == null) {
          if (validImagePath) {
            if (_results.length == 1) {
              break;
            }
          } else {
            break;
          }
        } else if (endMovieId != null && _currentMovieId == endMovieId)
          break;
        else if (endMovieId == null &&
            items != null &&
            _results.length == items) break;

        if (endMovieId != null || decrement) {
          _currentMovieId--;
        } else {
          _currentMovieId++;
        }
      } on Exception catch (_error) {
        if (_error
            .toString()
            .contains("The resource you requested could not be found")) {
          _currentMovieId--;
        } else {
          Utils.error(_error);
        }
      }
    }

    return _results;
  }

  //MOVIE now playing
  Future<MovieNowPlaying> nowPlaying(
      {int page: 1, String? language, bool random: false}) async {
    var response =
        await Utils.fetchData(UrlMaker.movieNowPlaying(page, language));
    if (Utils.isValidResponse(response) && random) {
      int? page = Utils.randomBetween(
          MovieNowPlaying.fromJson(json.decode(response.body)).totalPages!);
      response =
          await Utils.fetchData(UrlMaker.movieNowPlaying(page, language));
    }

    return MovieNowPlaying.fromJson(json.decode(response.body));
  }

  //Tv video. (Trailer)
  Future<Video> video(int movieId) async {
    final response = await Utils.fetchData(UrlMaker.movieVideo(movieId));
    return Video.fromJson(json.decode(response.body));
  }

  Future<dynamic> rate(String sessionId, int movieId, double value) async {
    String url = UrlMaker.movieRate(sessionId, movieId);

    Map<String, dynamic> body = {
      "value": value,
    };

    final response = await Utils.writeData(url, body);
    print(response.body);

    return response;
  }

  Future<dynamic> deleteRate(String sessionId, int movieId) async {
    String url = UrlMaker.movieRate(sessionId, movieId);

    final response = await Utils.writeData(url, null);
    print(response.body);

    return response;
  }
}
