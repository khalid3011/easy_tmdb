import 'Category/Discover.dart';
import 'Category/Episode.dart';
import 'Category/FindExternal.dart';
import 'Category/Movie.dart';
import 'Category/Peoples.dart';
import 'Category/Search.dart';
import 'Category/Trending.dart';
import 'Category/Tv.dart';
import 'Category/Genre.dart';
import 'Category/Seasons.dart';

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
      ///thats not so important
      String language,

      ///image size contains image quality
      ///all image size are [w92, w154, w185, w342, w500, w780, original]
      String imageSize,

      ///api has 3 types of url
      ///1) poster path
      ///2) backdrop path
      ///3)
      ///sometime url returns null. for that app will be crash.
      ///for ignore this problem set a default image
      ///default image url : https://ispab.org/wp-content/themes/consultix/images/no-image-found-360x260.png
      String alternativeImageUrl,

      ///path returns only path
      ///but for display a image it need a full url
      ///that generate the full url with image size
      ///default value is true
      bool fullUrl,

      /// fixUrl also return full url with complete extra condition
      ///some object contains poster path and backdrop path
      ///fixUrl return a valid url
      ///at first check posterPath. if its valid then return poster path
      ///otherwise check backdropPath if valid the return backdropPath
      ///otherwise return noImage
      ///default value is FALSE
      bool fixUrl}) {
    if (tmdbKey == null || tmdbKey.trim().length == 0) {
      throw Exception("Invalid tmdb key");
    } else {
      _init(tmdbKey, language, imageSize, alternativeImageUrl, fixUrl, fullUrl);
    }
  }

  static _init(tmdbKey, language, imageSize, alternativeImageUrl, bool fixUrl,
      bool fullUrl) {
    mKey = tmdbKey;
    mLanguage = language == null ? "en-US" : language;
    mImageSize = imageSize == null ? "w342" : imageSize;
    mAlternativeImageUrl = alternativeImageUrl == null
        ? "https://ispab.org/wp-content/themes/consultix/images/no-image-found-360x260.png"
        : alternativeImageUrl;
    mFullUrl = fullUrl == null ? true : fullUrl;
    mFixUrl = fixUrl == null ? false : fixUrl;
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
}
