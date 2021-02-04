import 'package:easytmdb/export/export_all.dart';

class Seasons {
  Future<Season> details(int tvId, int seasonNumber, {String language}) async {
    final response =
        await Utils.fetchData(UrlMaker.season(tvId, seasonNumber, language));

    return Season.fromJson(json.decode(response.body));
  }

  Future<List<Season>> detailsAllSeason(int tvId, int totalSeasonNumber,
      {String language}) async {
    List<Season> temp = List();

    for (int seasonNo = 0; seasonNo <= totalSeasonNumber; seasonNo++) {
      final response =
          await Utils.fetchData(UrlMaker.season(tvId, seasonNo, language));
      temp.add(Season.fromJson(json.decode(response.body)));
    }
    return temp;
  }
}
