import 'package:easytmdb/export/export_all.dart';

class Tv {
  //TV images
  Future<TvImage> image(int tvId) async {
    final response = await Utils.fetchData(UrlMaker.tvImage(tvId));

    return TvImage.fromJson(json.decode(response.body));
  }

  //TV credits
  Future<TvCredits> credits(int tvId) async {
    final response = await Utils.fetchData(UrlMaker.tvCredits(tvId));

    return TvCredits.fromJson(json.decode(response.body));
  }

  //TV details
  Future<TvDetails> details(int tvId, {String language}) async {
    final response = await Utils.fetchData(UrlMaker.tvDetails(tvId, language));

    return TvDetails.fromJson(json.decode(response.body));
  }

  //TV similar
  Future<TvSimilar> similar(int tvId,
      {int page: 1, String language, bool random: false}) async {
    var response =
        await Utils.fetchData(UrlMaker.tvSimilar(tvId, page, language));
    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          TvSimilar.fromJson(json.decode(response.body)).totalPages);
      response =
          await Utils.fetchData(UrlMaker.tvSimilar(tvId, page, language));
    }

    return TvSimilar.fromJson(json.decode(response.body));
  }

  //TV top rated
  Future<TvTopRated> topRated(
      {int page: 1, String language, bool random: false}) async {
    var response = await Utils.fetchData(UrlMaker.tvTopRated(page, language));
    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          TvTopRated.fromJson(json.decode(response.body)).totalPages);
      response = await Utils.fetchData(UrlMaker.tvTopRated(page, language));
    }

    return TvTopRated.fromJson(json.decode(response.body));
  }

  //TV popular
  Future<TvPopular> popular(
      {int page: 1, String language, bool random: false}) async {
    var response = await Utils.fetchData(UrlMaker.tvPopular(page, language));

    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          TvPopular.fromJson(json.decode(response.body)).totalPages);
      response = await Utils.fetchData(UrlMaker.tvPopular(page, language));
    }

    return TvPopular.fromJson(json.decode(response.body));
  }

  //TV latest
  Future<TvLatest> latest({String language}) async {
    final response = await Utils.fetchData(UrlMaker.tvLatest(language));

    return TvLatest.fromJson(json.decode(response.body));
  }

  ///read details in [detailsWithMore()]
  Future<List<TvDetails>> latestWithMore({
    bool validImagePath,
    int items,
  }) async {
    final response = await latest();
    List<TvDetails> _result;

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

  ///if you provide [items] the size of List<TvDetails> same as [items]
  ///[items] is always decrement that means
  ///if your [items] is 3 and [startTvId] is 100 then it will return 100 99 98.....
  ///if you want to increment then set false to [decrement]
  ///if you provide [endTvId] then [items] and  [decrement] will not work
  ///if some id not found then it will ignore automatically
  Future<List<TvDetails>> detailsWithMore(
    int startTvId, {
    int endTvId,
    int items,
    bool validImagePath = false,
    bool decrement = true,
  }) async {
    List<TvDetails> _results = List();

    if (endTvId != null) {
      //start > end
      if (startTvId < endTvId) {
        int temp = startTvId;
        startTvId = endTvId;
        endTvId = temp;
      }
    }
    int _currentTvId = startTvId;

    while (true) {
      try {
        TvDetails _details = await details(_currentTvId);
        if (validImagePath) {
          if (Utils.validImagePath(_details.posterPath) ||
              Utils.validImagePath(_details.backdropPath)) {
            _results.add(_details);
          }
        } else {
          _results.add(_details);
        }

        if (endTvId == null && items == null) {
          if (validImagePath) {
            if (_results.length == 1) {
              break;
            }
          } else {
            break;
          }
        } else if (endTvId != null && _currentTvId == endTvId)
          break;
        else if (endTvId == null && items != null && _results.length == items)
          break;

        if (endTvId != null || decrement) {
          _currentTvId--;
        } else {
          _currentTvId++;
        }
      } on Exception catch (_error) {
        if (_error
            .toString()
            .contains("The resource you requested could not be found")) {
          _currentTvId--;
        } else {
          Utils.error(_error);
        }
      }
    }

    return _results;
  }

  //TV on the air
  Future<TvOnTheAir> onTheAir(
      {int page: 1, String language, bool random: false}) async {
    var response = await Utils.fetchData(UrlMaker.tvOnTheAir(page, language));
    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          TvOnTheAir.fromJson(json.decode(response.body)).totalPages);
      response = await Utils.fetchData(UrlMaker.tvOnTheAir(page, language));
    }

    return TvOnTheAir.fromJson(json.decode(response.body));
  }

  //TV airing today
  Future<TvAiringToday> airingToday(
      {int page: 1, String language, bool random: false}) async {
    var response =
        await Utils.fetchData(UrlMaker.tvAiringToday(page, language));
    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          TvAiringToday.fromJson(json.decode(response.body)).totalPages);
      response = await Utils.fetchData(UrlMaker.tvAiringToday(page, language));
    }

    return TvAiringToday.fromJson(json.decode(response.body));
  }

  //Tv video. (Trailer)
  Future<Video> video(int tvId) async {
    final response = await Utils.fetchData(UrlMaker.tvVideo(tvId));
    return Video.fromJson(json.decode(response.body));
  }
}
