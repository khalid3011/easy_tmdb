import 'package:easyTMDB/export/export_all.dart';

class Episode {
  Future<SeasonEpisodes> details(int tvId, int seasonNumber, int episodeNumber,
      {String language}) async {
    var response = await Utils.fetchData(
        UrlMaker.episode(tvId, seasonNumber, episodeNumber, language));

    return SeasonEpisodes.fromJson(json.decode(response.body));
  }
}
