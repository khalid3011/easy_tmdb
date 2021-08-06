import 'package:tmdb_easy/helper/utils.dart';

class MovieTopRated {
  int? page;
  int? totalResults;
  int? totalPages;
  List<MovieTopRatedResults>? results;

  MovieTopRated({this.page, this.totalResults, this.totalPages, this.results});

  MovieTopRated.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalResults = json['total_results'];
    this.totalPages = json['total_pages'];
    this.results = (json['results'] as List?) != null
        ? (json['results'] as List)
            .map((i) => MovieTopRatedResults.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    data['results'] = this.results != null
        ? this.results!.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class MovieTopRatedResults {
  String? posterPath;
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

  MovieTopRatedResults(
      {this.posterPath,
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

  MovieTopRatedResults.fromJson(Map<String, dynamic> json) {
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
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
