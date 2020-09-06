import 'dart:convert';

import 'package:easytmdb/Model/Movie/MovieCredits.dart';
import 'package:easytmdb/Model/Movie/MovieDetails.dart';
import 'package:easytmdb/Model/Movie/MovieImage.dart';
import 'package:easytmdb/Model/Movie/MovieLatest.dart';
import 'package:easytmdb/Model/Movie/MovieNowPlaying.dart';
import 'package:easytmdb/Model/Movie/MovieSimilar.dart';
import 'package:easytmdb/Model/Movie/MovieTopRated.dart';
import 'package:easytmdb/Model/video.dart';
import 'package:http/http.dart' as http;
import 'package:easytmdb/Helper/Utils.dart';
import 'package:easytmdb/Helper/UrlMaker.dart';
import 'package:easytmdb/Model/Movie/MovieUpcoming.dart';

import '../Model/Movie/MoviePopular.dart';

class Movie {
  //MOVIE images
  Future<MovieImage> image(int movieId) async {
    var response = await http.get(UrlMaker.movieImage(movieId));

    return Utils.isValidResponse(response)
        ? MovieImage.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //MOVIE credits
  Future<MovieCredits> credits(int movieId) async {
    var response = await http.get(UrlMaker.movieCredits(movieId));

    return Utils.isValidResponse(response)
        ? MovieCredits.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //MOVIE details
  Future<MovieDetails> details(int movieId, {String language}) async {
    var response = await http.get(UrlMaker.movieDetails(movieId, language));

    return Utils.isValidResponse(response)
        ? MovieDetails.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //MOVIE similar
  Future<MovieSimilar> similar(int movieId,
      {int page: 1, String language, bool random: false}) async {
    var response =
        await http.get(UrlMaker.movieSimilar(movieId, page, language));
    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          MovieSimilar.fromJson(json.decode(response.body)).totalPages);
      response = await http.get(UrlMaker.movieSimilar(movieId, page, language));
    }

    return Utils.isValidResponse(response)
        ? MovieSimilar.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //MOVIE top rated
  Future<MovieTopRated> topRated(
      {int page: 1, String language, bool random: false}) async {
    var response = await http.get(UrlMaker.movieTopRated(page, language));
    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          MovieTopRated.fromJson(json.decode(response.body)).totalPages);
      response = await http.get(UrlMaker.movieTopRated(page, language));
    }

    return Utils.isValidResponse(response)
        ? MovieTopRated.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //MOVIE popular
  Future<MoviePopular> popular(
      {int page: 1, String language, bool random: false}) async {
    var response = await http.get(UrlMaker.moviePopular(page, language));

    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          MoviePopular.fromJson(json.decode(response.body)).totalPages);
      response = await http.get(UrlMaker.moviePopular(page, language));
    }

    return Utils.isValidResponse(response)
        ? MoviePopular.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //MOVIE upcoming
  Future<MovieUpcoming> upcoming(
      {int page: 1, String language, bool random: false}) async {
    var response = await http.get(UrlMaker.movieUpcoming(page, language));
    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          MovieUpcoming.fromJson(json.decode(response.body)).totalPages);
      response = await http.get(UrlMaker.movieUpcoming(page, language));
    }

    return Utils.isValidResponse(response)
        ? MovieUpcoming.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //MOVIE latest
  Future<MovieLatest> latest({String language}) async {
    var response = await http.get(UrlMaker.movieLatest(language));

    return Utils.isValidResponse(response)
        ? MovieLatest.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  ///read details in [detailsWithMore()]
  Future<List<MovieDetails>> latestWithMore({
    bool validImagePath,
    int items,
  }) async {
    var response = await latest();
    List<MovieDetails> _result;

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
    int startMovieId, {
    String language,
    int endMovieId,
    int items,
    bool validImagePath = false,
    bool decrement = true,
    bool adult = false,
  }) async {
    List<MovieDetails> _results = List();

    if (endMovieId != null) {
      //start > end
      if (startMovieId < endMovieId) {
        int temp = startMovieId;
        startMovieId = endMovieId;
        endMovieId = temp;
      }
    }
    int _currentMovieId = startMovieId;

    while (true) {
      try {
        MovieDetails _details = await details(_currentMovieId);
        if (validImagePath) {
          if (Utils.validImagePath(_details.posterPath) ||
              Utils.validImagePath(_details.backdropPath)) {
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
      {int page: 1, String language, bool random: false}) async {
    var response = await http.get(UrlMaker.movieNowPlaying(page, language));
    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          MovieNowPlaying.fromJson(json.decode(response.body)).totalPages);
      response = await http.get(UrlMaker.movieNowPlaying(page, language));
    }

    return Utils.isValidResponse(response)
        ? MovieNowPlaying.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //Tv video. (Trailer)
  Future<Video> video(int movieId) async {
    var response = await http.get(UrlMaker.movieVideo(movieId));
    return Utils.isValidResponse(response)
        ? Video.fromJson(json.decode(response.body))
        : Utils.error(response);
  }
}
