import 'package:easytmdb/Helper/utils.dart';

import '../genres.dart';
import '../network.dart';
import '../production_company.dart';

class TvDetails {
  String backdropPath;
  String firstAirDate;
  String homepage;
  String lastAirDate;
  String name;
  String nextEpisodeToAir;
  String originalLanguage;
  String originalName;
  String overview;
  String posterPath;
  String status;
  String type;
  bool inProduction;
  var popularity;
  var voteAverage;
  int id;
  int numberOfEpisodes;
  int numberOfSeasons;
  int voteCount;
  TvDetailsLastEpisodeToAir lastEpisodeToAir;
  List<int> episodeRunTime;
  List<String> languages;
  List<String> originCountry;
  List<TvDetailsCreatedBy> createdBy;
  List<TvDetailsGenres> genres;
  List<TvDetailsNetworks> networks;
  List<TvDetailsProductionCompanies> productionCompanies;
  List<TvDetailsSeasons> seasons;

  TvDetails(
      {this.backdropPath,
      this.firstAirDate,
      this.homepage,
      this.lastAirDate,
      this.name,
      this.nextEpisodeToAir,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.posterPath,
      this.status,
      this.type,
      this.inProduction,
      this.popularity,
      this.voteAverage,
      this.id,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.voteCount,
      this.lastEpisodeToAir,
      this.createdBy,
      this.genres,
      this.networks,
      this.productionCompanies,
      this.seasons,
      this.episodeRunTime,
      this.languages,
      this.originCountry});

  TvDetails.fromJson(Map<String, dynamic> json) {
    this.firstAirDate = json['first_air_date'];
    this.homepage = json['homepage'];
    this.lastAirDate = json['last_air_date'];
    this.name = json['name'];
    this.nextEpisodeToAir = json['next_episode_to_air'];
    this.originalLanguage = json['original_language'];
    this.originalName = json['original_name'];
    this.overview = json['overview'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.status = json['status'];
    this.type = json['type'];
    this.inProduction = json['in_production'];
    this.popularity = json['popularity'];
    this.voteAverage = json['vote_average'];
    this.id = json['id'];
    this.numberOfEpisodes = json['number_of_episodes'];
    this.numberOfSeasons = json['number_of_seasons'];
    this.voteCount = json['vote_count'];
    this.lastEpisodeToAir = json['last_episode_to_air'] != null
        ? TvDetailsLastEpisodeToAir.fromJson(json['last_episode_to_air'])
        : null;
    this.createdBy = (json['created_by'] as List) != null
        ? (json['created_by'] as List)
            .map((i) => TvDetailsCreatedBy.fromJson(i))
            .toList()
        : null;
    this.genres = (json['genres'] as List) != null
        ? (json['genres'] as List)
            .map((i) => TvDetailsGenres.fromJson(i))
            .toList()
        : null;
    this.networks = (json['networks'] as List) != null
        ? (json['networks'] as List)
            .map((i) => TvDetailsNetworks.fromJson(i))
            .toList()
        : null;
    this.productionCompanies = (json['production_companies'] as List) != null
        ? (json['production_companies'] as List)
            .map((i) => TvDetailsProductionCompanies.fromJson(i))
            .toList()
        : null;
    this.seasons = (json['seasons'] as List) != null
        ? (json['seasons'] as List)
            .map((i) => TvDetailsSeasons.fromJson(i))
            .toList()
        : null;

    List<dynamic> episodeRunTimeList = json['episode_run_time'];
    this.episodeRunTime = new List();
    this
        .episodeRunTime
        .addAll(episodeRunTimeList.map((o) => int.parse(o.toString())));

    List<dynamic> languagesList = json['languages'];
    this.languages = new List();
    this.languages.addAll(languagesList.map((o) => o.toString()));

    List<dynamic> originCountryList = json['origin_country'];
    this.originCountry = new List();
    if (originCountryList != null) {
      this.originCountry.addAll(originCountryList.map((o) => o.toString()));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['first_air_date'] = this.firstAirDate;
    data['homepage'] = this.homepage;
    data['last_air_date'] = this.lastAirDate;
    data['name'] = this.name;
    data['next_episode_to_air'] = this.nextEpisodeToAir;
    data['original_language'] = this.originalLanguage;
    data['original_name'] = this.originalName;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['status'] = this.status;
    data['type'] = this.type;
    data['in_production'] = this.inProduction;
    data['popularity'] = this.popularity;
    data['vote_average'] = this.voteAverage;
    data['id'] = this.id;
    data['number_of_episodes'] = this.numberOfEpisodes;
    data['number_of_seasons'] = this.numberOfSeasons;
    data['vote_count'] = this.voteCount;
    if (this.lastEpisodeToAir != null) {
      data['last_episode_to_air'] = this.lastEpisodeToAir.toJson();
    }
    data['created_by'] = this.createdBy != null
        ? this.createdBy.map((i) => i.toJson()).toList()
        : null;
    data['genres'] = this.genres != null
        ? this.genres.map((i) => i.toJson()).toList()
        : null;
    data['networks'] = this.networks != null
        ? this.networks.map((i) => i.toJson()).toList()
        : null;
    data['production_companies'] = this.productionCompanies != null
        ? this.productionCompanies.map((i) => i.toJson()).toList()
        : null;
    data['seasons'] = this.seasons != null
        ? this.seasons.map((i) => i.toJson()).toList()
        : null;
    data['episode_run_time'] = this.episodeRunTime;
    data['languages'] = this.languages;
    data['origin_country'] = this.originCountry;
    return data;
  }
}

class TvDetailsLastEpisodeToAir {
  String airDate;
  String name;
  String overview;
  String productionCode;
  String stillPath;
  var voteAverage;
  int episodeNumber;
  int id;
  int seasonNumber;
  int showId;
  int voteCount;

  TvDetailsLastEpisodeToAir(
      {this.airDate,
      this.name,
      this.overview,
      this.productionCode,
      this.stillPath,
      this.voteAverage,
      this.episodeNumber,
      this.id,
      this.seasonNumber,
      this.showId,
      this.voteCount});

  TvDetailsLastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    this.airDate = json['air_date'];
    this.name = json['name'];
    this.overview = json['overview'];
    this.productionCode = json['production_code'];
    this.stillPath = Utils.userConditionalUrl(json['still_path'], null, true);
    this.voteAverage = json['vote_average'];
    this.episodeNumber = json['episode_number'];
    this.id = json['id'];
    this.seasonNumber = json['season_number'];
    this.showId = json['show_id'];
    this.voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_date'] = this.airDate;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['production_code'] = this.productionCode;
    data['still_path'] = this.stillPath;
    data['vote_average'] = this.voteAverage;
    data['episode_number'] = this.episodeNumber;
    data['id'] = this.id;
    data['season_number'] = this.seasonNumber;
    data['show_id'] = this.showId;
    data['vote_count'] = this.voteCount;
    return data;
  }
}

class TvDetailsCreatedBy {
  String creditId;
  String name;
  String profilePath;
  int id;
  int gender;

  TvDetailsCreatedBy(
      {this.creditId, this.name, this.profilePath, this.id, this.gender});

  TvDetailsCreatedBy.fromJson(Map<String, dynamic> json) {
    this.creditId = json['credit_id'];
    this.name = json['name'];
    this.profilePath = json['profile_path'];
    this.id = json['id'];
    this.gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credit_id'] = this.creditId;
    data['name'] = this.name;
    data['profile_path'] = this.profilePath;
    data['id'] = this.id;
    data['gender'] = this.gender;
    return data;
  }
}

class TvDetailsGenres extends Genres {
  TvDetailsGenres.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class TvDetailsNetworks extends Network {
  TvDetailsNetworks.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class TvDetailsProductionCompanies extends ProductionCompanies {
  TvDetailsProductionCompanies.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}

class TvDetailsSeasons {
  String airDate;
  String name;
  String overview;
  String posterPath;
  int episodeCount;
  int id;
  int seasonNumber;

  TvDetailsSeasons(
      {this.airDate,
      this.name,
      this.overview,
      this.posterPath,
      this.episodeCount,
      this.id,
      this.seasonNumber});

  TvDetailsSeasons.fromJson(Map<String, dynamic> json) {
    this.airDate = json['air_date'];
    this.name = json['name'];
    this.overview = json['overview'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.episodeCount = json['episode_count'];
    this.id = json['id'];
    this.seasonNumber = json['season_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_date'] = this.airDate;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['episode_count'] = this.episodeCount;
    data['id'] = this.id;
    data['season_number'] = this.seasonNumber;
    return data;
  }
}
