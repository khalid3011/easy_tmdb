import 'dart:convert';

import 'package:easytmdb/Helper/UrlMaker.dart';
import 'package:easytmdb/Helper/Utils.dart';
import 'package:easytmdb/Model/Season/Season.dart';
import 'package:http/http.dart' as http;

class Episode {
  Future<SeasonEpisodes> details(int tvId, int seasonNumber, int episodeNumber,
      {String language}) async {
    var response = await http
        .get(UrlMaker.episode(tvId, seasonNumber, episodeNumber, language));

    return Utils.isValidResponse(response)
        ? SeasonEpisodes.fromJson(json.decode(response.body))
        : Utils.error(response);
  }
}
