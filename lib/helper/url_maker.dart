import 'package:easytmdb/easyTMDB.dart';
import 'package:easytmdb/enum_/user_created_sort_by.dart';

class UrlMaker {
  ///init
  static final String _baseUrl = "https://api.themoviedb.org/3/";

  ///custom method
  static String _key() => "?api_key=" + EasyTMDB.mKey;

  static String _getSessionId(String sessionId) =>
      "&session_id=" + sessionId.trim();

  static String _getSortBy(String sortBy) =>
      "&sort_by=" +
      (sortBy == null
          ? UserCreatedSortBy.created_at.asc
          : sortBy.toLowerCase().trim());

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
      (includeAdult == null
          ? false.toString()
          : includeAdult.toString().trim());

  ///AUTH
  static String requestToken() {
    String path = "authentication/token/new";
    return _baseUrl + path + _key();
  }

  static String askPermission(String token) {
    String path = "https://www.themoviedb.org/authenticate/";
    return path + token;
  }

  static String createSeason(String token) {
    String path = "authentication/session/new";
    String data = "&request_token=$token";
    return _baseUrl + path + _key() + data;
  }

  static String createSeasonWithLogin(
      String username, String password, String token) {
    String path = "authentication/token/validate_with_login";
    String data = "&username=$username&password=$password&request_token=$token";
    return _baseUrl + path + _key() + data;
  }

  ///USERS
  static String userDetails(String sessionId) {
    String path = "account";
    String data = _getSessionId(sessionId);
    return _baseUrl + path + _key() + data;
  }

  static String userCreatedList(String sessionId, int page, String language) {
    String path = "account/{account_id}/lists";
    String data =
        _getSessionId(sessionId) + _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String userActivity(
    String path,
    String sessionId,
    int page,
    String language,
    String sortBy,
  ) {
    String data = _getSessionId(sessionId) +
        _getPage(page) +
        _getLanguage(language) +
        _getSortBy(sortBy);
    return _baseUrl + path + _key() + data;
  }

  static String markAsFavorite(String sessionId) {
    String path = "account/{account_id}/favorite";
    String data = _getSessionId(sessionId);
    return _baseUrl + path + _key() + data;
  }

  static String addToWatchlist(String sessionId) {
    String path = "account/{account_id}/watchlist";
    String data = _getSessionId(sessionId);
    return _baseUrl + path + _key() + data;
  }

  static String movieRate(String sessionId, int movieId) {
    String path = "movie/$movieId/rating";
    String data = _getSessionId(sessionId);
    return _baseUrl + path + _key() + data;
  }

  ///MOVIE
  static String movieNowPlaying(int page, String language) {
    String path = "movie/now_playing";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String movieLatest(String language) {
    String path = "movie/latest";
    String data = _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String movieUpcoming(int page, String language) {
    String path = "movie/upcoming";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String moviePopular(int page, String language) {
    String path = "movie/popular";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String movieTopRated(int page, String language) {
    String path = "movie/top_rated";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String movieSimilar(int movieId, int page, String language) {
    String path = "movie/" + movieId.toString() + "/similar";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String movieDetails(int movieId, String language) {
    String path = "movie/" + movieId.toString();
    String data = _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String movieCredits(int movieId) {
    String path = "movie/" + movieId.toString() + "/credits";
    return _baseUrl + path + _key();
  }

  static String movieImage(int movieId) {
    String path = "movie/" + movieId.toString() + "/images";
    return _baseUrl + path + _key();
  }

  static String movieVideo(int movieId) {
    String path = "movie/" + movieId.toString() + "/videos";
    return _baseUrl + path + _key();
  }

  ///TV
  static String tvAiringToday(int page, String language) {
    String path = "tv/airing_today";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String tvOnTheAir(int page, String language) {
    String path = "tv/on_the_air";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String tvLatest(String language) {
    String path = "tv/latest";
    String data = _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String tvPopular(int page, String language) {
    String path = "tv/popular";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String tvTopRated(int page, String language) {
    String path = "tv/top_rated";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String tvSimilar(int tvId, int page, String language) {
    String path = "tv/" + tvId.toString() + "/similar";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String tvDetails(int tvId, String language) {
    String path = "tv/" + tvId.toString();
    String data = _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  static String tvCredits(int tvId) {
    String path = "tv/" + tvId.toString() + "/credits";
    return _baseUrl + path + _key();
  }

  static String tvImage(int tvId) {
    String path = "tv/" + tvId.toString() + "/images";
    return _baseUrl + path + _key();
  }

  static String tvVideo(int tvId) {
    String path = "tv/" + tvId.toString() + "/videos";
    return _baseUrl + path + _key();
  }

  ///SEASON
  static String season(int tvId, int seasonNumber, String language) {
    String path =
        "tv/" + tvId.toString() + "/season/" + seasonNumber.toString();
    String data = _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  ///EPISODE
  static String episode(
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
  static String genreMovie() {
    String path = "genre/movie/list";
    return _baseUrl + path + _key();
  }

  static String genreTv() {
    String path = "genre/tv/list";
    return _baseUrl + path + _key();
  }

  ///PEOPLE
  static String peopleDetails(int personId) {
    String path = "person/" + personId.toString();
    return _baseUrl + path + _key();
  }

  static String peopleImage(int personId) {
    String path = "person/" + personId.toString();
    return _baseUrl + path + _key();
  }

  static String peopleMovieCredits(int personId) {
    String path = "person/" + personId.toString() + "/movie_credits";
    return _baseUrl + path + _key();
  }

  static String peopleTvCredits(int personId) {
    String path = "person/" + personId.toString() + "/tv_credits";
    return _baseUrl + path + _key();
  }

  static String peoplePopular(int page, String language) {
    String path = "person/popular";
    String data = _getPage(page) + _getLanguage(language);
    return _baseUrl + path + _key() + data;
  }

  ///TRENDING
  static String trendingMovieDay() {
    String path = "trending/movie/day";
    return _baseUrl + path + _key();
  }

  static String trendingMovieWeek() {
    String path = "trending/movie/week";
    return _baseUrl + path + _key();
  }

  static String trendingTvDay() {
    String path = "trending/tv/day";
    return _baseUrl + path + _key();
  }

  static String trendingTvWeek() {
    String path = "trending/tv/week";
    return _baseUrl + path + _key();
  }

  static String trendingPersonDay() {
    String path = "trending/person/day";
    return _baseUrl + path + _key();
  }

  static String trendingPersonWeek() {
    String path = "trending/person/week";
    return _baseUrl + path + _key();
  }

  static String trendingAllDay() {
    String path = "trending/all/day";
    return _baseUrl + path + _key();
  }

  static String trendingAllWeek() {
    String path = "trending/all/week";
    return _baseUrl + path + _key();
  }

  ///SEARCH
  static String searchMovie(String query, String language, int page,
      bool includeAdult, String region, int year, int primaryReleaseYear) {
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

  static String searchTv(String query, String language, int page,
      bool includeAdult, int firstAirDateYear) {
    String path = "search/tv";
    String data = _getQuery(query) +
        _getLanguage(language) +
        _getPage(page) +
        _getIncludeAdult(includeAdult) +
        _getFirstAirDateYear(firstAirDateYear);

    return _baseUrl + path + _key() + data;
  }

  static String searchPeople(String query, String language, int page,
      bool includeAdult, String region) {
    String path = "search/person";
    String data = _getQuery(query) +
        _getLanguage(language) +
        _getPage(page) +
        _getIncludeAdult(includeAdult) +
        _getRegion(region);

    return _baseUrl + path + _key() + data;
  }

  static String searchCompany(String query, int page) {
    String path = "search/company";
    String data = _getQuery(query) + _getPage(page);
    return _baseUrl + path + _key() + data;
  }

  static String searchKeyword(String query, int page) {
    String path = "search/keyword";
    String data = _getQuery(query) + _getPage(page);
    return _baseUrl + path + _key() + data;
  }

  static String searchCollections(String query, String language, int page) {
    String path = "search/collection";
    String data = _getQuery(query) + _getLanguage(language) + _getPage(page);
    return _baseUrl + path + _key() + data;
  }

  static String searchMulti(String query, String language, int page,
      bool includeAdult, String region) {
    String path = "search/multi";
    String data = _getQuery(query) +
        _getLanguage(language) +
        _getPage(page) +
        _getIncludeAdult(includeAdult) +
        _getRegion(region);

    return _baseUrl + path + _key() + data;
  }

  ///FIND
  static String find(String id, String externalSource) {
    String path = "find/" + id;
    String data = "&external_source=" + externalSource;
    return _baseUrl + path + _key() + data;
  }

  static String discoverMovie(Map<String, dynamic> userData, int page) {
    String path = "discover/movie";
    String data = _getPage(page);
    userData.forEach((k, v) {
      data += "&" + k.toString() + "=" + v.toString();
    });
    return _baseUrl + path + _key() + data;
  }

  static String discoverTv(Map<String, dynamic> userData, int page) {
    String path = "discover/tv";
    String data = _getPage(page);
    userData.forEach((k, v) {
      data += "&" + k.toString() + "=" + v.toString();
    });
    return _baseUrl + path + _key() + data;
  }
}
