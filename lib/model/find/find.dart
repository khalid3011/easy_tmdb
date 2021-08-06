import 'package:tmdb_easy/helper/utils.dart';

class Find {
  List<FindMovieResults>? movieResults;
  List<FindPersonResults>? personResults;
  List<FindTvResults>? tvResults;
  List<FindTvEpisodeResults>? tvEpisodeResults;
  List<FindTvEpisodeResults>? tvSeasonResults;

  Find(
      {this.movieResults,
      this.personResults,
      this.tvResults,
      this.tvEpisodeResults,
      this.tvSeasonResults});

  Find.fromJson(Map<String, dynamic> json) {
    this.movieResults = (json['movie_results'] as List?) != null
        ? (json['movie_results'] as List)
            .map((i) => FindMovieResults.fromJson(i))
            .toList()
        : null;
    this.personResults = (json['person_results'] as List?) != null
        ? (json['person_results'] as List)
            .map((i) => FindPersonResults.fromJson(i))
            .toList()
        : null;
    this.tvResults = (json['tv_results'] as List?) != null
        ? (json['tv_results'] as List)
            .map((i) => FindTvResults.fromJson(i))
            .toList()
        : null;
    this.tvEpisodeResults = (json['tv_episode_results'] as List?) != null
        ? (json['tv_episode_results'] as List)
            .map((i) => FindTvEpisodeResults.fromJson(i))
            .toList()
        : null;
    this.tvEpisodeResults = (json['tv_season_results'] as List?) != null
        ? (json['tv_season_results'] as List)
            .map((i) => FindTvEpisodeResults.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movie_results'] = this.movieResults != null
        ? this.movieResults!.map((i) => i.toJson()).toList()
        : null;
    data['person_results'] = this.personResults != null
        ? this.personResults!.map((i) => i.toJson()).toList()
        : null;
    data['tv_results'] = this.tvResults != null
        ? this.tvResults!.map((i) => i.toJson()).toList()
        : null;
    data['tv_episode_results'] = this.tvEpisodeResults != null
        ? this.tvEpisodeResults!.map((i) => i.toJson()).toList()
        : null;
    data['tv_season_results'] = this.tvEpisodeResults != null
        ? this.tvEpisodeResults!.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class FindMovieResults {
  String? title;
  String? releaseDate;
  String? originalLanguage;
  String? originalTitle;
  String? backdropPath;
  String? overview;
  String? posterPath;
  bool? video;
  bool? adult;
  var voteAverage;
  var popularity;
  int? id;
  int? voteCount;
  List<int?>? genreIds;

  FindMovieResults(
      {this.title,
      this.releaseDate,
      this.originalLanguage,
      this.originalTitle,
      this.backdropPath,
      this.overview,
      this.posterPath,
      this.video,
      this.adult,
      this.voteAverage,
      this.popularity,
      this.id,
      this.voteCount,
      this.genreIds});

  FindMovieResults.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.releaseDate = json['release_date'];
    this.originalLanguage = json['original_language'];
    this.originalTitle = json['original_title'];
    this.overview = json['overview'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.video = json['video'];
    this.adult = json['adult'];
    this.voteAverage = json['vote_average'];
    this.popularity = json['popularity'];
    this.id = json['id'];
    this.voteCount = json['vote_count'];

    List<dynamic>? genreIdsList = json['genre_ids'];
    this.genreIds = [];
    if (genreIdsList != null) {
      this.genreIds!.addAll(genreIdsList.map((o) => int.tryParse(o.toString())));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['release_date'] = this.releaseDate;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['backdrop_path'] = this.backdropPath;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['video'] = this.video;
    data['adult'] = this.adult;
    data['vote_average'] = this.voteAverage;
    data['popularity'] = this.popularity;
    data['id'] = this.id;
    data['vote_count'] = this.voteCount;
    data['genre_ids'] = this.genreIds;
    return data;
  }
}

class FindPersonResults {
  String? knownForDepartment;
  String? profilePath;
  String? name;
  bool? adult;
  var popularity;
  int? id;
  int? gender;
  List<FindPersonResultsKnownFor>? knownFor;

  FindPersonResults(
      {this.knownForDepartment,
      this.profilePath,
      this.name,
      this.adult,
      this.popularity,
      this.id,
      this.gender,
      this.knownFor});

  FindPersonResults.fromJson(Map<String, dynamic> json) {
    this.knownForDepartment = json['known_for_department'];
    this.profilePath = json['profile_path'];
    this.name = json['name'];
    this.adult = json['adult'];
    this.popularity = json['popularity'];
    this.id = json['id'];
    this.gender = json['gender'];
    this.knownFor = (json['known_for'] as List?) != null
        ? (json['known_for'] as List)
            .map((i) => FindPersonResultsKnownFor.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['known_for_department'] = this.knownForDepartment;
    data['profile_path'] = this.profilePath;
    data['name'] = this.name;
    data['adult'] = this.adult;
    data['popularity'] = this.popularity;
    data['id'] = this.id;
    data['gender'] = this.gender;
    data['known_for'] = this.knownFor != null
        ? this.knownFor!.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class FindPersonResultsKnownFor {
  String? posterPath;
  String? mediaType;
  String? backdropPath;
  String? originalLanguage;
  String? originalTitle;
  String? title;
  String? overview;
  String? releaseDate;
  bool? video;
  bool? adult;
  var popularity;
  var voteAverage;
  int? voteCount;
  int? id;
  List<int?>? genreIds;

  FindPersonResultsKnownFor(
      {this.posterPath,
      this.mediaType,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.title,
      this.overview,
      this.releaseDate,
      this.video,
      this.adult,
      this.popularity,
      this.voteAverage,
      this.voteCount,
      this.id,
      this.genreIds});

  FindPersonResultsKnownFor.fromJson(Map<String, dynamic> json) {
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.mediaType = json['media_type'];
    this.originalLanguage = json['original_language'];
    this.originalTitle = json['original_title'];
    this.title = json['title'];
    this.overview = json['overview'];
    this.releaseDate = json['release_date'];
    this.video = json['video'];
    this.adult = json['adult'];
    this.popularity = json['popularity'];
    this.voteAverage = json['vote_average'];
    this.voteCount = json['vote_count'];
    this.id = json['id'];

    List<dynamic>? genreIdsList = json['genre_ids'];
    this.genreIds = [];
    if (genreIdsList != null) {
      this.genreIds!.addAll(genreIdsList.map((o) => int.tryParse(o.toString())));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poster_path'] = this.posterPath;
    data['media_type'] = this.mediaType;
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['title'] = this.title;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['video'] = this.video;
    data['adult'] = this.adult;
    data['popularity'] = this.popularity;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['id'] = this.id;
    data['genre_ids'] = this.genreIds;
    return data;
  }
}

class FindTvResults {
  String? originalName;
  String? name;
  String? firstAirDate;
  String? posterPath;
  String? originalLanguage;
  String? backdropPath;
  String? overview;
  var voteAverage;
  var popularity;
  int? id;
  int? voteCount;
  List<int?>? genreIds;
  List<String>? originCountry;

  FindTvResults(
      {this.originalName,
      this.name,
      this.firstAirDate,
      this.posterPath,
      this.originalLanguage,
      this.backdropPath,
      this.overview,
      this.voteAverage,
      this.popularity,
      this.id,
      this.voteCount,
      this.genreIds,
      this.originCountry});

  FindTvResults.fromJson(Map<String, dynamic> json) {
    this.originalName = json['original_name'];
    this.name = json['name'];
    this.firstAirDate = json['first_air_date'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.originalLanguage = json['original_language'];
    this.overview = json['overview'];
    this.voteAverage = json['vote_average'];
    this.popularity = json['popularity'];
    this.id = json['id'];
    this.voteCount = json['vote_count'];

    List<dynamic>? genreIdsList = json['genre_ids'];
    this.genreIds = [];
    if (genreIdsList != null) {
      this.genreIds!.addAll(genreIdsList.map((o) => int.tryParse(o.toString())));
    }

    List<dynamic>? originCountryList = json['origin_country'];
    this.originCountry = [];
    if (originCountryList != null) {
      this.originCountry!.addAll(originCountryList.map((o) => o.toString()));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original_name'] = this.originalName;
    data['name'] = this.name;
    data['first_air_date'] = this.firstAirDate;
    data['poster_path'] = this.posterPath;
    data['original_language'] = this.originalLanguage;
    data['backdrop_path'] = this.backdropPath;
    data['overview'] = this.overview;
    data['vote_average'] = this.voteAverage;
    data['popularity'] = this.popularity;
    data['id'] = this.id;
    data['vote_count'] = this.voteCount;
    data['genre_ids'] = this.genreIds;
    data['origin_country'] = this.originCountry;
    return data;
  }
}

class FindTvEpisodeResults {
  String? airDate;
  String? name;
  String? overview;
  String? productionCode;
  String? stillPath;
  var voteAverage;
  int? episodeNumber;
  int? id;
  int? seasonNumber;
  int? showId;
  int? voteCount;

  FindTvEpisodeResults(
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

  FindTvEpisodeResults.fromJson(Map<String, dynamic> json) {
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
