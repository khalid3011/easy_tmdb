import 'package:easytmdb/Helper/Utils.dart';

class Crew {
  String department;
  String originalLanguage;
  String originalTitle;
  String job;
  String overview;
  String releaseDate;
  String title;
  String backdropPath;
  String posterPath;
  String creditId;
  bool video;
  bool adult;
  var voteAverage;
  var popularity;
  int id;
  int voteCount;
  List<int> genreIds;

  Crew(
      {this.department,
      this.originalLanguage,
      this.originalTitle,
      this.job,
      this.overview,
      this.releaseDate,
      this.title,
      this.backdropPath,
      this.posterPath,
      this.creditId,
      this.video,
      this.adult,
      this.voteAverage,
      this.popularity,
      this.id,
      this.voteCount,
      this.genreIds});

  Crew.fromJson(Map<String, dynamic> json) {
    this.department = json['department'];
    this.originalLanguage = json['original_language'];
    this.originalTitle = json['original_title'];
    this.job = json['job'];
    this.overview = json['overview'];
    this.releaseDate = json['release_date'];
    this.title = json['title'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.creditId = json['credit_id'];
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
    data['department'] = this.department;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['job'] = this.job;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['backdrop_path'] = this.backdropPath;
    data['poster_path'] = this.posterPath;
    data['credit_id'] = this.creditId;
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
