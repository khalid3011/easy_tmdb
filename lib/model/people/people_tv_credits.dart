import 'package:easytmdb/Helper/utils.dart';

class PeopleTvCredits {
  int id;
  List<PeopleTvCreditsCast> cast;

  PeopleTvCredits({this.id, this.cast});

  PeopleTvCredits.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.cast = (json['cast'] as List) != null
        ? (json['cast'] as List)
            .map((i) => PeopleTvCreditsCast.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cast'] =
        this.cast != null ? this.cast.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class PeopleTvCreditsCast {
  String creditId;
  String originalName;
  String originalLanguage;
  String character;
  String name;
  String backdropPath;
  String firstAirDate;
  String overview;
  String posterPath;
  var popularity;
  int id;
  int voteCount;
  int episodeCount;
  var voteAverage;
  List<int> genreIds;
  List<String> originCountry;

  PeopleTvCreditsCast(
      {this.creditId,
      this.originalName,
      this.originalLanguage,
      this.character,
      this.name,
      this.backdropPath,
      this.firstAirDate,
      this.overview,
      this.posterPath,
      this.popularity,
      this.id,
      this.voteCount,
      this.episodeCount,
      this.voteAverage,
      this.genreIds,
      this.originCountry});

  PeopleTvCreditsCast.fromJson(Map<String, dynamic> json) {
    this.creditId = json['credit_id'];
    this.originalName = json['original_name'];
    this.originalLanguage = json['original_language'];
    this.character = json['character'];
    this.name = json['name'];
    this.firstAirDate = json['first_air_date'];
    this.overview = json['overview'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.popularity = json['popularity'];
    this.id = json['id'];
    this.voteCount = json['vote_count'];
    this.episodeCount = json['episode_count'];
    this.voteAverage = json['vote_average'];

    List<dynamic> genreIdsList = json['genre_ids'];
    this.genreIds = new List();
    if (genreIdsList != null) {
      this.genreIds.addAll(genreIdsList.map((o) => int.tryParse(o.toString())));
    }

    List<dynamic> originCountryList = json['origin_country'];
    this.originCountry = new List();
    if (originCountryList != null) {
      this.originCountry.addAll(originCountryList.map((o) => o.toString()));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credit_id'] = this.creditId;
    data['original_name'] = this.originalName;
    data['original_language'] = this.originalLanguage;
    data['character'] = this.character;
    data['name'] = this.name;
    data['backdrop_path'] = this.backdropPath;
    data['first_air_date'] = this.firstAirDate;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['popularity'] = this.popularity;
    data['id'] = this.id;
    data['vote_count'] = this.voteCount;
    data['episode_count'] = this.episodeCount;
    data['vote_average'] = this.voteAverage;
    data['genre_ids'] = this.genreIds;
    data['origin_country'] = this.originCountry;
    return data;
  }
}
