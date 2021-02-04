import 'package:easytmdb/Helper/Utils.dart';

class TrendingAll {
  int page;
  int totalPages;
  int totalResults;
  List<TrendingAllRsults> results;

  TrendingAll({this.page, this.totalPages, this.totalResults, this.results});

  TrendingAll.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalPages = json['total_pages'];
    this.totalResults = json['total_results'];
    this.results = (json['results'] as List) != null
        ? (json['results'] as List)
            .map((i) => TrendingAllRsults.fromJson(i))
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

class TrendingAllRsults {
  String title;
  String releaseDate;
  String originalLanguage;
  String originalTitle;
  String backdropPath;
  String overview;
  String posterPath;
  String mediaType;
  bool video;
  bool adult;
  var voteAverage;
  var popularity;
  int id;
  int voteCount;
  List<int> genreIds;

  TrendingAllRsults(
      {this.title,
      this.releaseDate,
      this.originalLanguage,
      this.originalTitle,
      this.backdropPath,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.video,
      this.adult,
      this.voteAverage,
      this.popularity,
      this.id,
      this.voteCount,
      this.genreIds});

  TrendingAllRsults.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.releaseDate = json['release_date'];
    this.originalLanguage = json['original_language'];
    this.originalTitle = json['original_title'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.overview = json['overview'];
    this.mediaType = json['media_type'];
    this.video = json['video'];
    this.adult = json['adult'];
    this.voteAverage = json['vote_average'];
    this.popularity = json['popularity'];
    this.id = json['id'];
    this.voteCount = json['vote_count'];

    List<dynamic> genreIdsList = json['genre_ids'];
    this.genreIds = new List();
    if (genreIdsList != null) {
      this.genreIds.addAll(genreIdsList.map((o) => int.tryParse(o.toString())));
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
    data['media_type'] = this.mediaType;
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
