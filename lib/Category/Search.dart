import 'dart:convert';

import 'package:easytmdb/Helper/UrlMaker.dart';
import 'package:easytmdb/Helper/Utils.dart';
import 'package:easytmdb/Model/Search/SearchCollections.dart';
import 'package:easytmdb/Model/Search/SearchCompany.dart';
import 'package:easytmdb/Model/Search/SearchKeyword.dart';
import 'package:easytmdb/Model/Search/SearchMovie.dart';
import 'package:easytmdb/Model/Search/SearchMulti.dart';
import 'package:easytmdb/Model/Search/SearchPeople.dart';
import 'package:easytmdb/Model/Search/SearchTv.dart';
import 'package:http/http.dart' as http;

class Search {
  Future<SearchMovie> movie(String query,
      {String language,
      int page,
      bool includeAdult,
      String region,
      int year,
      int primaryReleaseYear}) async {
    var response = await http.get(UrlMaker.searchMovie(
        query, language, page, includeAdult, region, year, primaryReleaseYear));

    return Utils.isValidResponse(response)
        ? SearchMovie.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<SearchTv> tv(String query,
      {String language,
      int page,
      bool includeAdult,
      int firstAirDateYear}) async {
    var response = await http.get(UrlMaker.searchTv(
        query, language, page, includeAdult, firstAirDateYear));

    return Utils.isValidResponse(response)
        ? SearchTv.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<SearchPeople> people(String query,
      {String language, int page, bool includeAdult, String region}) async {
    var response = await http.get(
        UrlMaker.searchPeople(query, language, page, includeAdult, region));

    return Utils.isValidResponse(response)
        ? SearchPeople.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<SearchCompany> company(String query, {int page}) async {
    var response = await http.get(UrlMaker.searchCompany(query, page));

    return Utils.isValidResponse(response)
        ? SearchCompany.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<SearchKeyword> keyword(String query, {int page}) async {
    var response = await http.get(UrlMaker.searchKeyword(query, page));

    return Utils.isValidResponse(response)
        ? SearchKeyword.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<SearchCollections> collection(String query,
      {String language, int page}) async {
    var response =
        await http.get(UrlMaker.searchCollections(query, language, page));

    return Utils.isValidResponse(response)
        ? SearchCollections.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  ///movie, tv, people
  Future<SearchMulti> multi(String query,
      {String language, int page, bool includeAdult, String region}) async {
    var response = await http
        .get(UrlMaker.searchMulti(query, language, page, includeAdult, region));

    return Utils.isValidResponse(response)
        ? SearchMulti.fromJson(json.decode(response.body))
        : Utils.error(response);
  }
}
