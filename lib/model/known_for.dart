import 'package:easy_tmdb/Helper/utils.dart';

class KnownFor {
  String originalName;
  String posterPath;
  String mediaType;
  String name;
  String firstAirDate;
  String originalLanguage;
  String backdropPath;
  String overview;
  var voteAverage;
  int voteCount;
  int id;
  List<int> genreIds;
  List<String> originCountry;

  KnownFor(
      {this.originalName,
      this.posterPath,
      this.mediaType,
      this.name,
      this.firstAirDate,
      this.originalLanguage,
      this.backdropPath,
      this.overview,
      this.voteAverage,
      this.voteCount,
      this.id,
      this.genreIds,
      this.originCountry});

  KnownFor.fromJson(Map<String, dynamic> json) {
    this.originalName = json['original_name'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.mediaType = json['media_type'];
    this.name = json['name'];
    this.firstAirDate = json['first_air_date'];
    this.originalLanguage = json['original_language'];
    this.overview = json['overview'];
    this.voteAverage = json['vote_average'];
    this.voteCount = json['vote_count'];
    this.id = json['id'];

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
    data['original_name'] = this.originalName;
    data['poster_path'] = this.posterPath;
    data['media_type'] = this.mediaType;
    data['name'] = this.name;
    data['first_air_date'] = this.firstAirDate;
    data['original_language'] = this.originalLanguage;
    data['backdrop_path'] = this.backdropPath;
    data['overview'] = this.overview;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['id'] = this.id;
    data['genre_ids'] = this.genreIds;
    data['origin_country'] = this.originCountry;
    return data;
  }
}
