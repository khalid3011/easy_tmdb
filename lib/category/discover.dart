import 'package:easyTMDB/export/export_all.dart';

class Discover {
  Future<DiscoverMovie> movie(Map<String, dynamic> data,{int page: 1}) async {
    var response = await Utils.fetchData(UrlMaker.discoverMovie(data,page));

    return DiscoverMovie.fromJson(json.decode(response.body));
  }

  Future<DiscoverTv> tv(Map<String, dynamic> data,{int page: 1}) async {
    var response = await Utils.fetchData(UrlMaker.discoverTv(data,page));

    return DiscoverTv.fromJson(json.decode(response.body));
  }
}
