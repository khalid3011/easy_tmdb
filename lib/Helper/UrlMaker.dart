import 'package:easytmdb/EasyTMDB.dart';

class UrlMaker {
  ///init
  static final String _baseUrl = "https://api.themoviedb.org/3/";

  ///custom method
  static String _key() => "?api_key=" + EasyTMDB.mKey;

  static String _getPage(int page) =>
      "&page=" + (page == null ? 1.toString() : page.toString().trim());

  static String _getYear(int year) =>
      "&year=" + (year == null ? "" : year.toString().trim());

  static String _getFirstAirDateYear(int firstAirDateYear) =>
      "&first_air_date_year=" +
      (firstAirDateYear == null ? "" : firstAirDateYear.toString().trim());

  static String _getPrimaryReleaseYear(int primaryReleaseYear) =>
      "&primary_release_year=" +
      (primaryReleaseYear == null ? "" : primaryReleaseYear.toString().trim());

  static String _getLanguage(String language) =>
      "&language=" + (language == null ? EasyTMDB.mLanguage : language.trim());

  static String _getQuery(String query) =>
      "&query=" + (query == null ? "" : query.trim());

  static String _getRegion(String region) =>
      "&region=" + (region == null ? "" : region.trim());

  static String _getIncludeAdult(bool includeAdult) =>
      "&include_adult=" +
      (includeAdult == null ? false.toString() : includeAdult.toString().trim());

  ///MOVIE
  static movieNowPlaying(int page, String language) {
    String path = "movie/now_playing";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static movieLatest(String language) {
    String path = "movie/latest";
    String data = _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static movieUpcoming(int page, String language) {
    String path = "movie/upcoming";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String moviePopular(int page, String language) {
    String path = "movie/popular";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static movieTopRated(int page, String language) {
    String path = "movie/top_rated";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static movieSimilar(int movieId, int page, String language) {
    String path = "movie/" + movieId.toString() + "/similar";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static movieDetails(int movieId, String language) {
    String path = "movie/" + movieId.toString();
    String data = _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static movieCredits(int movieId) {
    String path = "movie/" + movieId.toString() + "/credits";
    return _baseUrl + path + _key();
  }

  static movieImage(int movieId) {
    String path = "movie/" + movieId.toString() + "/images";
    return _baseUrl + path + _key();
  }

  static movieVideo(int movieId) {
    String path = "movie/" + movieId.toString() + "/videos";
    return _baseUrl + path + _key();
  }

  ///TV
  static tvAiringToday(int page, String language) {
    String path = "tv/airing_today";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static tvOnTheAir(int page, String language) {
    String path = "tv/on_the_air";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static tvLatest(String language) {
    String path = "tv/latest";
    String data = _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static tvPopular(int page, String language) {
    String path = "tv/popular";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static tvTopRated(int page, String language) {
    String path = "tv/top_rated";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static tvSimilar(int tvId, int page, String language) {
    String path = "tv/" + tvId.toString() + "/similar";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static tvDetails(int tvId, String language) {
    String path = "tv/" + tvId.toString();
    String data = _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static tvCredits(int tvId) {
    String path = "tv/" + tvId.toString() + "/credits";
    return _baseUrl + path + _key();
  }

  static tvImage(int tvId) {
    String path = "tv/" + tvId.toString() + "/images";
    return _baseUrl + path + _key();
  }

  static tvVideo(int tvId) {
    String path = "tv/" + tvId.toString() + "/videos";
    return _baseUrl + path + _key();
  }



  ///SEASON
  static season(int tvId, int seasonNumber, String language) {
    String path =
        "tv/" + tvId.toString() + "/season/" + seasonNumber.toString();
    String data = _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  ///EPISODE
  static episode(
      int tvId, int seasonNumber, int episodeNumber, String language) {
    String path = "tv/" +
        tvId.toString() +
        "/season/" +
        seasonNumber.toString() +
        "/episode/" +
        episodeNumber.toString();
    String data = _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  ///GENRE
  static genreMovie() {
    String path = "genre/movie/list";
    return _baseUrl + path + _key();
  }

  static genreTv() {
    String path = "genre/tv/list";
    return _baseUrl + path + _key();
  }

  ///PEOPLE
  static peopleDetails(int personId) {
    String path = "person/" + personId.toString();
    return _baseUrl + path + _key();
  }

  static peopleImage(int personId) {
    String path = "person/" + personId.toString();
    return _baseUrl + path + _key();
  }

  static peopleMovieCredits(int personId) {
    String path = "person/" + personId.toString() + "/movie_credits";
    return _baseUrl + path + _key();
  }

  static peopleTvCredits(int personId) {
    String path = "person/" + personId.toString() + "/tv_credits";
    return _baseUrl + path + _key();
  }


  static peoplePopular(int page, String language) {
    String path = "person/popular";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  ///TRENDING
  static trendingMovieDay() {
    String path = "trending/movie/day";
    return _baseUrl + path + _key();
  }

  static trendingMovieWeek() {
    String path = "trending/movie/week";
    return _baseUrl + path + _key();
  }

  static trendingTvDay() {
    String path = "trending/tv/day";
    return _baseUrl + path + _key();
  }

  static trendingTvWeek() {
    String path = "trending/tv/week";
    return _baseUrl + path + _key();
  }

  static trendingPersonDay() {
    String path = "trending/person/day";
    return _baseUrl + path + _key();
  }

  static trendingPersonWeek() {
    String path = "trending/person/week";
    return _baseUrl + path + _key();
  }

  static trendingAllDay() {
    String path = "trending/all/day";
    return _baseUrl + path + _key();
  }

  static trendingAllWeek() {
    String path = "trending/all/week";
    return _baseUrl + path + _key();
  }

  ///SEARCH
  static searchMovie(String query, String language, int page, bool includeAdult,
      String region, int year, int primaryReleaseYear) {
    String path = "search/movie";
    String data = _getQuery(query) +
        _getLanguage(language) +
        _getPage(page) +
        _getIncludeAdult(includeAdult) +
        _getRegion(region) +
        _getYear(year) +
        _getPrimaryReleaseYear(primaryReleaseYear);

    return _baseUrl + path + _key() + data;
  }

  static searchTv(String query, String language, int page, bool includeAdult,
      int firstAirDateYear) {
    String path = "search/tv";
    String data = _getQuery(query) +
        _getLanguage(language) +
        _getPage(page) +
        _getIncludeAdult(includeAdult) +
        _getFirstAirDateYear(firstAirDateYear);

    return _baseUrl + path + _key() + data;
  }

  static searchPeople(String query, String language, int page,
      bool includeAdult, String region) {
    String path = "search/person";
    String data = _getQuery(query) +
        _getLanguage(language) +
        _getPage(page) +
        _getIncludeAdult(includeAdult) +
        _getRegion(region);

    return _baseUrl + path + _key() + data;
  }

  static searchCompany(String query, int page) {
    String path = "search/company";
    String data = _getQuery(query) + _getPage(page);
    return _baseUrl + path + _key() + data;
  }

  static searchKeyword(String query, int page) {
    String path = "search/keyword";
    String data = _getQuery(query) + _getPage(page);
    return _baseUrl + path + _key() + data;
  }

  static searchCollections(String query, String language, int page) {
    String path = "search/collection";
    String data = _getQuery(query) + _getLanguage(language) + _getPage(page);
    return _baseUrl + path + _key() + data;
  }

  static searchMulti(String query, String language, int page, bool includeAdult,
      String region) {
    String path = "search/multi";
    String data = _getQuery(query) +
        _getLanguage(language) +
        _getPage(page) +
        _getIncludeAdult(includeAdult) +
        _getRegion(region);

    return _baseUrl + path + _key() + data;
  }

  ///FIND
  static find(String id, String externalSource) {
    String path = "find/" + id;
    String data = "&external_source=" + externalSource;
    return _baseUrl + path + _key() + data;
  }

  static discoverMovie(Map<String, dynamic> userData) {
    String path = "discover/movie";
    String data = "";
    userData.forEach((k, v) {
      data += "&" + k.toString() + "=" + v.toString();
    });
    return _baseUrl + path + _key() + data;
  }

  static discoverTv(Map<String, dynamic> userData) {
    String path = "discover/tv";
    String data = "";
    userData.forEach((k, v) {
      data += "&" + k.toString() + "=" + v.toString();
    });
    return _baseUrl + path + _key() + data;
  }
}
