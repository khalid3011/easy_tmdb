import 'package:tmdb_easy/helper/utils.dart';

class UserRatedMovie {
  int? page;
  int? totalPages;
  int? totalResults;
  List<UserRatedMovieResults>? results;

  UserRatedMovie({this.page, this.totalPages, this.totalResults, this.results});

  UserRatedMovie.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalPages = json['total_pages'];
    this.totalResults = json['total_results'];
    this.results = (json['results'] as List?) != null
        ? (json['results'] as List)
            .map((i) => UserRatedMovieResults.fromJson(i))
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

class UserRatedMovieResults {
  String? title;
  String? releaseDate;
  String? originalLanguage;
  String? originalTitle;
  String? backdropPath;
  String? overview;
  String? posterPath;
  bool? video;
  bool? adult;
  double? voteAverage;
  double? popularity;
  int? id;
  int? voteCount;
  var rating;
  List<int>? genreIds;

  UserRatedMovieResults(
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
      this.rating,
      this.genreIds});

  UserRatedMovieResults.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.releaseDate = json['release_date'];
    this.originalLanguage = json['original_language'];
    this.originalTitle = json['original_title'];
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.overview = json['overview'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.video = json['video'];
    this.adult = json['adult'];
    this.voteAverage = json['vote_average'];
    this.popularity = json['popularity'];
    this.id = json['id'];
    this.voteCount = json['vote_count'];
    this.rating = json['rating'];

    List<dynamic> genreIdsList = json['genre_ids'];
    this.genreIds = [];
    this.genreIds!.addAll(genreIdsList.map((o) => int.parse(o.toString())));
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
    data['rating'] = this.rating;
    data['genre_ids'] = this.genreIds;
    return data;
  }
}
