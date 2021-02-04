import 'dart:convert';

import 'package:easytmdb/Helper/UrlMaker.dart';
import 'package:easytmdb/Helper/Utils.dart';
import 'package:easytmdb/Model/Account/UserCreatedList.dart';
import 'package:easytmdb/Model/Account/UserDetails.dart';
import 'package:easytmdb/Model/Account/UserFavoriteMovie.dart';
import 'package:easytmdb/Model/Account/UserFavoriteTv.dart';
import 'package:easytmdb/Model/Account/UserMovieWatchList.dart';
import 'package:easytmdb/Model/Account/UserRatedMovie.dart';
import 'package:easytmdb/Model/Account/UserRatedTvShow.dart';
import 'package:easytmdb/Model/Account/UserTvWatchList.dart';
import 'package:http/http.dart' as http;

class User {
  Future<UserDetails> userDetails(String sessionId) async {
    final response = await http.get(UrlMaker.userDetails(sessionId));

    return Utils.isValidResponse(response)
        ? UserDetails.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<UserCreatedList> userCreatedList(String sessionId,
      {int page, String language}) async {
    final response =
        await http.get(UrlMaker.userCreatedList(sessionId, page, language));

    return Utils.isValidResponse(response)
        ? UserCreatedList.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<UserFavoriteMovie> userFavoriteMovie(
    String sessionId, {
    int page,
    String language,
    String sortBy,
  }) async {
    final String path = "account/{account_id}/favorite/movies";

    final response = await http
        .get(UrlMaker.userActivity(path, sessionId, page, language, sortBy));

    return Utils.isValidResponse(response)
        ? UserFavoriteMovie.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<UserFavoriteTv> userFavoriteTv(
    String sessionId, {
    int page,
    String language,
    String sortBy,
  }) async {
    String path = "account/{account_id}/favorite/tv";
    final response = await http
        .get(UrlMaker.userActivity(path, sessionId, page, language, sortBy));

    return Utils.isValidResponse(response)
        ? UserFavoriteTv.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<UserRatedMovie> userRatedMovie(
    String sessionId, {
    int page,
    String language,
    String sortBy,
  }) async {
    String path = "account/{account_id}/rated/movies";
    final response = await http
        .get(UrlMaker.userActivity(path, sessionId, page, language, sortBy));

    return Utils.isValidResponse(response)
        ? UserRatedMovie.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<UserRatedTvShow> userRatedTvShows(
    String sessionId, {
    int page,
    String language,
    String sortBy,
  }) async {
    String path = "account/{account_id}/rated/tv";
    final response = await http
        .get(UrlMaker.userActivity(path, sessionId, page, language, sortBy));

    return Utils.isValidResponse(response)
        ? UserRatedTvShow.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<UserMovieWatchList> userMovieWatchlist(
    String sessionId, {
    int page,
    String language,
    String sortBy,
  }) async {
    String path = "account/{account_id}/watchlist/movies";
    final response = await http
        .get(UrlMaker.userActivity(path, sessionId, page, language, sortBy));

    return Utils.isValidResponse(response)
        ? UserMovieWatchList.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<UserTvWatchList> userTvWatchlist(
    String sessionId, {
    int page,
    String language,
    String sortBy,
  }) async {
    String path = "account/{account_id}/watchlist/tv";
    final response = await http
        .get(UrlMaker.userActivity(path, sessionId, page, language, sortBy));

    return Utils.isValidResponse(response)
        ? UserTvWatchList.fromJson(json.decode(response.body))
        : Utils.error(response);
  }
}
