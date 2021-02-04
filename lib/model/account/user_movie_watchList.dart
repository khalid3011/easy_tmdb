import 'package:easytmdb/Helper/utils.dart';

class UserMovieWatchList {
  int page;
  int totalPages;
  int totalResults;
  List<UserMovieWatchListResults> results;

  UserMovieWatchList(
      {this.page, this.totalPages, this.totalResults, this.results});

  UserMovieWatchList.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalPages = json['total_pages'];
    this.totalResults = json['total_results'];
    this.results = (json['results'] as List) != null
        ? (json['results'] as List)
            .map((i) => UserMovieWatchListResults.fromJson(i))
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

class UserMovieWatchListResults {
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  bool adult;
  bool video;
  double voteAverage;
  double popularity;
  int id;
  int voteCount;
  List<int> genreIds;

  UserMovieWatchListResults(
      {this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.adult,
      this.video,
      this.voteAverage,
      this.popularity,
      this.id,
      this.voteCount,
      this.genreIds});

  UserMovieWatchListResults.fromJson(Map<String, dynamic> json) {
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.originalLanguage = json['original_language'];
    this.originalTitle = json['original_title'];
    this.overview = json['overview'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.releaseDate = json['release_date'];
    this.title = json['title'];
    this.adult = json['adult'];
    this.video = json['video'];
    this.voteAverage = json['vote_average'];
    this.popularity = json['popularity'];
    this.id = json['id'];
    this.voteCount = json['vote_count'];

    List<dynamic> genreIdsList = json['genre_ids'];
    this.genreIds = new List();
    this.genreIds.addAll(genreIdsList.map((o) => int.parse(o.toString())));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['adult'] = this.adult;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['popularity'] = this.popularity;
    data['id'] = this.id;
    data['vote_count'] = this.voteCount;
    data['genre_ids'] = this.genreIds;
    return data;
  }
}
