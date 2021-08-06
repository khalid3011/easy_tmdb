import 'package:tmdb_easy/helper/utils.dart';

class TrendingTv {
  int? page;
  int? totalPages;
  int? totalResults;
  List<TrendingTvResults>? results;

  TrendingTv({this.page, this.totalPages, this.totalResults, this.results});

  TrendingTv.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalPages = json['total_pages'];
    this.totalResults = json['total_results'];
    this.results = (json['results'] as List?) != null
        ? (json['results'] as List)
            .map((i) => TrendingTvResults.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    data['results'] = this.results != null
        ? this.results!.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class TrendingTvResults {
  String? originalName;
  String? name;
  String? firstAirDate;
  String? posterPath;
  String? originalLanguage;
  String? backdropPath;
  String? overview;
  String? mediaType;
  var popularity;
  int? id;
  int? voteCount;
  var voteAverage;
  List<int?>? genreIds;
  List<String>? originCountry;

  TrendingTvResults(
      {this.originalName,
      this.name,
      this.firstAirDate,
      this.posterPath,
      this.originalLanguage,
      this.backdropPath,
      this.overview,
      this.mediaType,
      this.popularity,
      this.id,
      this.voteCount,
      this.voteAverage,
      this.genreIds,
      this.originCountry});

  TrendingTvResults.fromJson(Map<String, dynamic> json) {
    this.originalName = json['original_name'];
    this.name = json['name'];
    this.firstAirDate = json['first_air_date'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.originalLanguage = json['original_language'];
    this.overview = json['overview'];
    this.mediaType = json['media_type'];
    this.popularity = json['popularity'];
    this.id = json['id'];
    this.voteCount = json['vote_count'];
    this.voteAverage = json['vote_average'];

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
    data['media_type'] = this.mediaType;
    data['popularity'] = this.popularity;
    data['id'] = this.id;
    data['vote_count'] = this.voteCount;
    data['vote_average'] = this.voteAverage;
    data['genre_ids'] = this.genreIds;
    data['origin_country'] = this.originCountry;
    return data;
  }
}
