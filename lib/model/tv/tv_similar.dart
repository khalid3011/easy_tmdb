import 'package:easy_tmdb/Helper/utils.dart';

class TvSimilar {
  int page;
  int totalPages;
  int totalResults;
  List<TvSimilarResults> results;

  TvSimilar({this.page, this.totalPages, this.totalResults, this.results});

  TvSimilar.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalPages = json['total_pages'];
    this.totalResults = json['total_results'];
    this.results = (json['results'] as List) != null
        ? (json['results'] as List)
            .map((i) => TvSimilarResults.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    data['results'] = this.results != null
        ? this.results.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class TvSimilarResults {
  String backdropPath;
  String firstAirDate;
  String name;
  String originalLanguage;
  String originalName;
  String overview;
  String posterPath;
  var popularity;
  int id;
  var voteAverage;
  int voteCount;
  List<int> genreIds;
  List<String> originCountry;

  TvSimilarResults(
      {this.backdropPath,
      this.firstAirDate,
      this.name,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.posterPath,
      this.popularity,
      this.id,
      this.voteAverage,
      this.voteCount,
      this.genreIds,
      this.originCountry});

  TvSimilarResults.fromJson(Map<String, dynamic> json) {
    this.firstAirDate = json['first_air_date'];
    this.name = json['name'];
    this.originalLanguage = json['original_language'];
    this.originalName = json['original_name'];
    this.overview = json['overview'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.popularity = json['popularity'];
    this.id = json['id'];
    this.voteAverage = json['vote_average'];
    this.voteCount = json['vote_count'];

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
    data['backdrop_path'] = this.backdropPath;
    data['first_air_date'] = this.firstAirDate;
    data['name'] = this.name;
    data['original_language'] = this.originalLanguage;
    data['original_name'] = this.originalName;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['popularity'] = this.popularity;
    data['id'] = this.id;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['genre_ids'] = this.genreIds;
    data['origin_country'] = this.originCountry;
    return data;
  }
}
