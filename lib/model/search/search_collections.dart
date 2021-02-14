import 'package:easyTMDB/Helper/utils.dart';

class SearchCollections {
  int page;
  int totalPages;
  int totalResults;
  List<SearchCollectionsResults> results;

  SearchCollections(
      {this.page, this.totalPages, this.totalResults, this.results});

  SearchCollections.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalPages = json['total_pages'];
    this.totalResults = json['total_results'];
    this.results = (json['results'] as List) != null
        ? (json['results'] as List)
            .map((i) => SearchCollectionsResults.fromJson(i))
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

class SearchCollectionsResults {
  String backdropPath;
  String name;
  String originalLanguage;
  String originalName;
  String overview;
  String posterPath;
  bool adult;
  int id;

  SearchCollectionsResults(
      {this.backdropPath,
      this.name,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.posterPath,
      this.adult,
      this.id});

  SearchCollectionsResults.fromJson(Map<String, dynamic> json) {
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.name = json['name'];
    this.originalLanguage = json['original_language'];
    this.originalName = json['original_name'];
    this.overview = json['overview'];
    this.adult = json['adult'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['name'] = this.name;
    data['original_language'] = this.originalLanguage;
    data['original_name'] = this.originalName;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['adult'] = this.adult;
    data['id'] = this.id;
    return data;
  }
}
