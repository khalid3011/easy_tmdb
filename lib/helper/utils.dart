import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:easytmdb/enum_/media_type.dart';
import 'package:http/http.dart' as http;
import 'package:easytmdb/easyTMDB.dart';

class Utils {
  static fetchData(String url, {timeoutSeconds = 10}) async {
    try {
      var response = await http
          .get(url)
          .timeout(Duration(seconds: timeoutSeconds), onTimeout: () {
        throw TimeoutException("Connection time out. Please try again");
      });

      return isValidResponse(response) ? response : error(response);
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      print("Request time out");
    } on Error catch (e) {
      print('Error: $e');
    }
  }

  static writeData(String url, Map<String, dynamic> body, {timeoutSeconds = 10,}) async {
    try {
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      ).timeout(Duration(seconds: timeoutSeconds), onTimeout: () {
        throw TimeoutException("Connection time out. Please try again");
      });

      return isValidResponse(response) ? response : error(response);
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      print("Request time out");
    } on Error catch (e) {
      print('Error: $e');
    }
  }

  static List<int> successResponse = [200,201,1,12];


  static bool isValidResponse(response) =>
      successResponse.contains(response.statusCode)? true : false;

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
      (path != null && path.length > 0 )
          ? true
          : false;

  static bool validImagePath(String path) {
    if (
        path.contains("http://image.tmdb.org/t/p/") ||
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
      String posterPath, String backdropPath, bool isPosterPath) {

    return EasyTMDB.mFixUrl
        ? fixImageUrl(posterPath, backdropPath)
        : EasyTMDB.mFullUrl
            ? generateTMDBImageUrl(isPosterPath ? posterPath : backdropPath)
            : isPosterPath
                ? posterPath
                : backdropPath;
  }
}
