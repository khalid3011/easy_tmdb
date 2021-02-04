import 'package:easytmdb/Helper/utils.dart';

class SearchTv {
  int page;
  int totalResults;
  int totalPages;
  List<SearchTvResults> results;

  SearchTv({this.page, this.totalResults, this.totalPages, this.results});

  SearchTv.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalResults = json['total_results'];
    this.totalPages = json['total_pages'];
    this.results = (json['results'] as List) != null
        ? (json['results'] as List)
            .map((i) => SearchTvResults.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    data['results'] = this.results != null
        ? this.results.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class SearchTvResults {
  String originalName;
  String name;
  String firstAirDate;
  String backdropPath;
  String originalLanguage;
  String overview;
  String posterPath;
  var popularity;
  var voteAverage;
  int voteCount;
  int id;
  List<int> genreIds;
  List<String> originCountry;

  SearchTvResults(
      {this.originalName,
      this.name,
      this.firstAirDate,
      this.backdropPath,
      this.originalLanguage,
      this.overview,
      this.posterPath,
      this.popularity,
      this.voteAverage,
      this.voteCount,
      this.id,
      this.genreIds,
      this.originCountry});

  SearchTvResults.fromJson(Map<String, dynamic> json) {
    this.originalName = json['original_name'];
    this.name = json['name'];
    this.firstAirDate = json['first_air_date'];
    this.originalLanguage = json['original_language'];
    this.overview = json['overview'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.popularity = json['popularity'];
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
    data['name'] = this.name;
    data['first_air_date'] = this.firstAirDate;
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['popularity'] = this.popularity;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['id'] = this.id;
    data['genre_ids'] = this.genreIds;
    data['origin_country'] = this.originCountry;
    return data;
  }
}
