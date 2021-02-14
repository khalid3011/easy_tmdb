import 'package:easyTMDB/Helper/utils.dart';

class Season {
  String uniqueId;
  String airDate;
  String name;
  String overview;
  String posterPath;
  int id;
  int seasonNumber;
  List<SeasonEpisodes> episodes;

  Season(
      {this.uniqueId,
      this.airDate,
      this.name,
      this.overview,
      this.posterPath,
      this.id,
      this.seasonNumber,
      this.episodes});

  Season.fromJson(Map<String, dynamic> json) {
    this.uniqueId = json['_id'];
    this.airDate = json['air_date'];
    this.name = json['name'];
    this.overview = json['overview'];
    this.posterPath = Utils.userConditionalUrl(json['poster_path'], null, true);
    this.id = json['id'];
    this.seasonNumber = json['season_number'];
    this.episodes = (json['episodes'] as List) != null
        ? (json['episodes'] as List)
            .map((i) => SeasonEpisodes.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.uniqueId;
    data['air_date'] = this.airDate;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['id'] = this.id;
    data['season_number'] = this.seasonNumber;
    data['episodes'] = this.episodes != null
        ? this.episodes.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class SeasonEpisodes {
  String airDate;
  String name;
  String overview;
  String productionCode;
  String stillPath;
  double voteAverage;
  int episodeNumber;
  int id;
  int seasonNumber;
  int showId;
  int voteCount;
  List<SeasonEpisodesCrew> crew;
  List<SeasonEpisodesGuestStars> guestStars;

  SeasonEpisodes(
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
      this.voteCount,
      this.crew,
      this.guestStars});

  SeasonEpisodes.fromJson(Map<String, dynamic> json) {
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
    this.crew = (json['crew'] as List) != null
        ? (json['crew'] as List)
            .map((i) => SeasonEpisodesCrew.fromJson(i))
            .toList()
        : null;
    this.guestStars = (json['guest_stars'] as List) != null
        ? (json['guest_stars'] as List)
            .map((i) => SeasonEpisodesGuestStars.fromJson(i))
            .toList()
        : null;
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
    data['crew'] =
        this.crew != null ? this.crew.map((i) => i.toJson()).toList() : null;
    data['guest_stars'] = this.guestStars != null
        ? this.guestStars.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class SeasonEpisodesCrew {
  String creditId;
  String name;
  String department;
  String job;
  String profilePath;
  int id;
  int gender;

  SeasonEpisodesCrew(
      {this.creditId,
      this.name,
      this.department,
      this.job,
      this.profilePath,
      this.id,
      this.gender});

  SeasonEpisodesCrew.fromJson(Map<String, dynamic> json) {
    this.creditId = json['credit_id'];
    this.name = json['name'];
    this.department = json['department'];
    this.job = json['job'];
    this.profilePath = json['profile_path'];
    this.id = json['id'];
    this.gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credit_id'] = this.creditId;
    data['name'] = this.name;
    data['department'] = this.department;
    data['job'] = this.job;
    data['profile_path'] = this.profilePath;
    data['id'] = this.id;
    data['gender'] = this.gender;
    return data;
  }
}

class SeasonEpisodesGuestStars extends SeasonEpisodesCrew {
  SeasonEpisodesGuestStars.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}
