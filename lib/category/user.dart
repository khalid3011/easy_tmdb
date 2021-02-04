import 'package:easytmdb/export/export_all.dart';

class User {
  Future<UserDetails> userDetails(String sessionId) async {
    final response = await Utils.fetchData(UrlMaker.userDetails(sessionId));

    return UserDetails.fromJson(json.decode(response.body));
  }

  Future<UserCreatedList> userCreatedList(String sessionId,
      {int page, String language}) async {
    final response = await Utils.fetchData(
        UrlMaker.userCreatedList(sessionId, page, language));

    return UserCreatedList.fromJson(json.decode(response.body));
  }

  Future<UserFavoriteMovie> userFavoriteMovie(
    String sessionId, {
    int page,
    String language,
    String sortBy,
  }) async {
    final String path = "account/{account_id}/favorite/movies";

    final response = await Utils.fetchData(
        UrlMaker.userActivity(path, sessionId, page, language, sortBy));

    return UserFavoriteMovie.fromJson(json.decode(response.body));
  }

  Future<UserFavoriteTv> userFavoriteTv(
    String sessionId, {
    int page,
    String language,
    String sortBy,
  }) async {
    String path = "account/{account_id}/favorite/tv";
    final response = await Utils.fetchData(
        UrlMaker.userActivity(path, sessionId, page, language, sortBy));

    return UserFavoriteTv.fromJson(json.decode(response.body));
  }

  Future<UserRatedMovie> userRatedMovie(
    String sessionId, {
    int page,
    String language,
    String sortBy,
  }) async {
    String path = "account/{account_id}/rated/movies";
    final response = await Utils.fetchData(
        UrlMaker.userActivity(path, sessionId, page, language, sortBy));

    return UserRatedMovie.fromJson(json.decode(response.body));
  }

  Future<UserRatedTvShow> userRatedTvShows(
    String sessionId, {
    int page,
    String language,
    String sortBy,
  }) async {
    String path = "account/{account_id}/rated/tv";
    final response = await Utils.fetchData(
        UrlMaker.userActivity(path, sessionId, page, language, sortBy));

    return UserRatedTvShow.fromJson(json.decode(response.body));
  }

  Future<UserMovieWatchList> userMovieWatchlist(
    String sessionId, {
    int page,
    String language,
    String sortBy,
  }) async {
    String path = "account/{account_id}/watchlist/movies";
    final response = await Utils.fetchData(
        UrlMaker.userActivity(path, sessionId, page, language, sortBy));

    return UserMovieWatchList.fromJson(json.decode(response.body));
  }

  Future<UserTvWatchList> userTvWatchlist(
    String sessionId, {
    int page,
    String language,
    String sortBy,
  }) async {
    String path = "account/{account_id}/watchlist/tv";
    final response = await Utils.fetchData(
        UrlMaker.userActivity(path, sessionId, page, language, sortBy));

    return UserTvWatchList.fromJson(json.decode(response.body));
  }
}
