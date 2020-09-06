import 'dart:convert';
import 'package:easytmdb/Model/Tv/TvAiringToday.dart';
import 'package:easytmdb/Model/Tv/TvCredits.dart';
import 'package:easytmdb/Model/Tv/TvDetails.dart';
import 'package:easytmdb/Model/Tv/TvImage.dart';
import 'package:easytmdb/Model/Tv/TvLatest.dart';
import 'package:easytmdb/Model/Tv/TvOnTheAir.dart';
import 'package:easytmdb/Model/Tv/TvPopular.dart';
import 'package:easytmdb/Model/Tv/TvSimilar.dart';
import 'package:easytmdb/Model/Tv/TvTopRated.dart';
import 'package:easytmdb/Model/video.dart';
import 'package:http/http.dart' as http;
import 'package:easytmdb/Helper/Utils.dart';
import 'package:easytmdb/Helper/UrlMaker.dart';

class Tv {
  //TV images
  Future<TvImage> image(int tvId) async {
    var response = await http.get(UrlMaker.tvImage(tvId));

    return Utils.isValidResponse(response)
        ? TvImage.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //TV credits
  Future<TvCredits> credits(int tvId) async {
    var response = await http.get(UrlMaker.tvCredits(tvId));

    return Utils.isValidResponse(response)
        ? TvCredits.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //TV details
  Future<TvDetails> details(int tvId, {String language}) async {
    var response = await http.get(UrlMaker.tvDetails(tvId, language));

    return Utils.isValidResponse(response)
        ? TvDetails.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //TV similar
  Future<TvSimilar> similar(int tvId,
      {int page: 1, String language, bool random: false}) async {
    var response = await http.get(UrlMaker.tvSimilar(tvId, page, language));
    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          TvSimilar.fromJson(json.decode(response.body)).totalPages);
      response = await http.get(UrlMaker.tvSimilar(tvId, page, language));
    }

    return Utils.isValidResponse(response)
        ? TvSimilar.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //TV top rated
  Future<TvTopRated> topRated(
      {int page: 1, String language, bool random: false}) async {
    var response = await http.get(UrlMaker.tvTopRated(page, language));
    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          TvTopRated.fromJson(json.decode(response.body)).totalPages);
      response = await http.get(UrlMaker.tvTopRated(page, language));
    }

    return Utils.isValidResponse(response)
        ? TvTopRated.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //TV popular
  Future<TvPopular> popular(
      {int page: 1, String language, bool random: false}) async {
    var response = await http.get(UrlMaker.tvPopular(page, language));

    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          TvPopular.fromJson(json.decode(response.body)).totalPages);
      response = await http.get(UrlMaker.tvPopular(page, language));
    }

    return Utils.isValidResponse(response)
        ? TvPopular.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //TV latest
  Future<TvLatest> latest({String language}) async {
    var response = await http.get(UrlMaker.tvLatest(language));

    return Utils.isValidResponse(response)
        ? TvLatest.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  ///read details in [detailsWithMore()]
  Future<List<TvDetails>> latestWithMore({
    bool validImagePath,
    int items,
  }) async {
    var response = await latest();
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
    var response = await http.get(UrlMaker.tvOnTheAir(page, language));
    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          TvOnTheAir.fromJson(json.decode(response.body)).totalPages);
      response = await http.get(UrlMaker.tvOnTheAir(page, language));
    }

    return Utils.isValidResponse(response)
        ? TvOnTheAir.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //TV airing today
  Future<TvAiringToday> airingToday(
      {int page: 1, String language, bool random: false}) async {
    var response = await http.get(UrlMaker.tvAiringToday(page, language));
    if (Utils.isValidResponse(response) && random) {
      int page = Utils.randomBetween(
          TvAiringToday.fromJson(json.decode(response.body)).totalPages);
      response = await http.get(UrlMaker.tvAiringToday(page, language));
    }

    return Utils.isValidResponse(response)
        ? TvAiringToday.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  //Tv video. (Trailer)
  Future<Video> video(int tvId) async {
    var response = await http.get(UrlMaker.tvVideo(tvId));
    return Utils.isValidResponse(response)
        ? Video.fromJson(json.decode(response.body))
        : Utils.error(response);
  }
}
