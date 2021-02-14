import 'package:easyTMDB/export/export_all.dart';

class Search {
  Future<SearchMovie> movie(
    String query, {
    String language,
    int page,
    bool includeAdult,
    String region,
    int year,
    int primaryReleaseYear,
  }) async {
    final response = await Utils.fetchData(UrlMaker.searchMovie(
        query, language, page, includeAdult, region, year, primaryReleaseYear));

    return SearchMovie.fromJson(json.decode(response.body));
  }

  Future<SearchTv> tv(String query,
      {String language,
      int page,
      bool includeAdult,
      int firstAirDateYear}) async {
    final response = await Utils.fetchData(UrlMaker.searchTv(
        query, language, page, includeAdult, firstAirDateYear));

    return SearchTv.fromJson(json.decode(response.body));
  }

  Future<SearchPeople> people(String query,
      {String language, int page, bool includeAdult, String region}) async {
    final response = await Utils.fetchData(
        UrlMaker.searchPeople(query, language, page, includeAdult, region));

    return SearchPeople.fromJson(json.decode(response.body));
  }

  Future<SearchCompany> company(String query, {int page}) async {
    final response = await Utils.fetchData(UrlMaker.searchCompany(query, page));

    return SearchCompany.fromJson(json.decode(response.body));
  }

  Future<SearchKeyword> keyword(String query, {int page}) async {
    final response = await Utils.fetchData(UrlMaker.searchKeyword(query, page));

    return SearchKeyword.fromJson(json.decode(response.body));
  }

  Future<SearchCollections> collection(String query,
      {String language, int page}) async {
    final response = await Utils.fetchData(
        UrlMaker.searchCollections(query, language, page));

    return SearchCollections.fromJson(json.decode(response.body));
  }

  ///movie, tv, people
  Future<SearchMulti> multi(String query,
      {String language, int page, bool includeAdult, String region}) async {
    final response = await Utils.fetchData(
        UrlMaker.searchMulti(query, language, page, includeAdult, region));

    return SearchMulti.fromJson(json.decode(response.body));
  }
}
