import 'dart:convert';

import 'package:easytmdb/Helper/UrlMaker.dart';
import 'package:easytmdb/Helper/Utils.dart';
import 'package:easytmdb/Model/Season/Season.dart';

import 'package:http/http.dart' as http;

class Seasons {
  Future<Season> details(int tvId, int seasonNumber, {String language}) async {
    final response =
        await http.get(UrlMaker.season(tvId, seasonNumber, language));

    return Utils.isValidResponse(response)
        ? Season.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<List<Season>> detailsAllSeason(int tvId, int totalSeasonNumber,
      {String language}) async {
    List<Season> temp = List();

    for (int seasonNo = 0; seasonNo <= totalSeasonNumber; seasonNo++) {
      final response =
          await http.get(UrlMaker.season(tvId, seasonNo, language));
      temp.add(Utils.isValidResponse(response)
          ? Season.fromJson(json.decode(response.body))
          : Utils.error(response));
    }
    return temp;
  }
}
