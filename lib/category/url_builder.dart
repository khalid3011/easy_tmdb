
import 'package:easytmdb/easyTMDB.dart';

class UrlBuilder{
  final String _baseUrl = "http://image.tmdb.org/t/p/";

  String build(String path,{String size = "original"}){
    if(!path.contains(_baseUrl))
      return path;

    if(EasyTMDB.mFixUrl || EasyTMDB.mFullUrl ){
      String removeBaseUrl = path.substring(_baseUrl.length);
      int sizeEndPoint = removeBaseUrl.indexOf("/");
      path = removeBaseUrl.substring(sizeEndPoint);
    }

    return _baseUrl + size + path;

  }
}