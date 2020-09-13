import 'dart:math';

import 'package:easytmdb/EasyTMDB.dart';

class Utils {
  static bool isValidResponse(response) =>
      response.statusCode == 200 ? true : false;

  static error(response) =>
      throw Exception('Failed to load. server status code:' +
          response.statusCode.toString() +
          ". " +
          response.body.toString());

  static int randomBetween(int max, {min: 1}) =>
      min + Random().nextInt(max - min);

  static String fixImageUrl(String posterPath, String backdropPath) =>
      isValidPath(posterPath)
          ? generateTMDBImageUrl(posterPath)
          : isValidPath(backdropPath)
              ? generateTMDBImageUrl(backdropPath)
              : EasyTMDB.mAlternativeImageUrl;

  static bool isValidPath(String path) =>
      (path != null && path.length > 0) ? true : false;

  static bool validImagePath(String path) {
    if (path.contains("http://image.tmdb.org/t/p/") ||
        path.startsWith("/") ||
        path.length == 32) {
      return true;
    }
    return false;
  }

  static String generateTMDBImageUrl(String path, {String size}) {
    String slash = path.startsWith("/") ? "" : "/";
    return "http://image.tmdb.org/t/p/" +
        (size == null ? EasyTMDB.mImageSize : size) +
        slash +
        path;
  }

  static String userConditionalUrl(
          String posterPath, String backdropPath, bool isPosterPath) =>
      EasyTMDB.mFixUrl
          ? fixImageUrl(posterPath, backdropPath)
          : EasyTMDB.mFullUrl
              ? generateTMDBImageUrl(isPosterPath ? posterPath : backdropPath)
              : isPosterPath ? posterPath : backdropPath;
}
