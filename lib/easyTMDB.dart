import 'package:tmdb_easy/category/url_builder.dart';


import 'export/export_all.dart';
export 'export/export_all.dart';

class EasyTMDB {
  static String mKey;
  static String mLanguage;
  static String mImageSize;
  static String mAlternativeImageUrl;
  static bool mFullUrl;
  static bool mFixUrl;

  EasyTMDB(

      ///your TMDB key
      ///collect form here: https://www.themoviedb.org/settings/api
      String tmdbKey,
      {

      ///default language : en-US
      String language,

      ///image size contains image quality
      String imageSize,

      ///api has 5 types of image url
      ///1) poster path
      ///2) backdrop path
      ///3) logo
      ///4) profile
      ///5) still
      ///sometime url returns null. for that app will be crash.
      ///for ignore this problem set a default image
      ///default image url : https://ispab.org/wp-content/themes/consultix/images/no-image-found-360x260.png
      String alternativeImageUrl,

      ///path returns only image path
      ///but for display a image it need a full url
      ///that generate the full url with image size
      ///default value is TRUE
      bool fullUrl,

      /// fixUrl also return full url with complete extra condition
      ///some object contains poster path and backdrop path
      ///fixUrl return a valid url followed bellow steps
      ///at first check posterPath. if its valid then return poster path
      ///otherwise check backdropPath if valid then return backdropPath
      ///otherwise return noImage
      ///default value is TRUE
      bool fixUrl}) {
    if (tmdbKey == null || tmdbKey.trim().length == 0) {
      throw Exception("TMDB key is required");
    } else {
      _init(tmdbKey, language, imageSize, alternativeImageUrl, fixUrl, fullUrl);
    }
  }

  static _init(tmdbKey, language, imageSize, alternativeImageUrl, bool fixUrl,
      bool fullUrl) {
    mKey = tmdbKey;
    mLanguage = language == null ? "en-US" : language;
    mImageSize = imageSize == null ? ImageSize().posterSize().original : imageSize;
    mAlternativeImageUrl = alternativeImageUrl == null
        ? "https://ispab.org/wp-content/themes/consultix/images/no-image-found-360x260.png"
        : alternativeImageUrl;
    mFullUrl = fullUrl == null ? true : fullUrl;
    mFixUrl = fixUrl == null ? true : fixUrl;
  }

  Movie movie() => Movie();

  Tv tv() => Tv();

  Seasons season() => Seasons();

  Episode episode() => Episode();

  Peoples people() => Peoples();

  Trending trending() => Trending();

  Search search() => Search();

  FindExternal find() => FindExternal();

  Discover discover() => Discover();

  Genre genres() => Genre();

  ImageSize imageSize() => ImageSize();

  Auth auth() => Auth();

  User user() => User();

  UrlBuilder urlBuilder() => UrlBuilder();

  MovieKeys movieKeys() => MovieKeys();

  TvKeys tvKeys() => TvKeys();


}
