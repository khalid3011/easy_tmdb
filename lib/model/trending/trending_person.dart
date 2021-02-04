import 'package:easytmdb/Helper/Utils.dart';

class TrendingPerson {
  int page;
  int totalPages;
  int totalResults;
  List<ResultsListBean> results;

  TrendingPerson({this.page, this.totalPages, this.totalResults, this.results});

  TrendingPerson.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalPages = json['total_pages'];
    this.totalResults = json['total_results'];
    this.results = (json['results'] as List) != null
        ? (json['results'] as List)
            .map((i) => ResultsListBean.fromJson(i))
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

class ResultsListBean {
  String name;
  String knownForDepartment;
  String profilePath;
  String mediaType;
  bool adult;
  var popularity;
  int gender;
  int id;
  List<KnownForListBean> knownFor;

  ResultsListBean(
      {this.name,
      this.knownForDepartment,
      this.profilePath,
      this.mediaType,
      this.adult,
      this.popularity,
      this.gender,
      this.id,
      this.knownFor});

  ResultsListBean.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.knownForDepartment = json['known_for_department'];
    this.profilePath = json['profile_path'];
    this.mediaType = json['media_type'];
    this.adult = json['adult'];
    this.popularity = json['popularity'];
    this.gender = json['gender'];
    this.id = json['id'];
    this.knownFor = (json['known_for'] as List) != null
        ? (json['known_for'] as List)
            .map((i) => KnownForListBean.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['known_for_department'] = this.knownForDepartment;
    data['profile_path'] = this.profilePath;
    data['media_type'] = this.mediaType;
    data['adult'] = this.adult;
    data['popularity'] = this.popularity;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['known_for'] = this.knownFor != null
        ? this.knownFor.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class KnownForListBean {
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  String mediaType;
  bool adult;
  bool video;
  var popularity;
  var id;
  var voteAverage;
  var voteCount;
  List<int> genreIds;

  KnownForListBean(
      {this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.mediaType,
      this.adult,
      this.video,
      this.popularity,
      this.id,
      this.voteAverage,
      this.voteCount,
      this.genreIds});

  KnownForListBean.fromJson(Map<String, dynamic> json) {
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.originalLanguage = json['original_language'];
    this.originalTitle = json['original_title'];
    this.overview = json['overview'];
    this.releaseDate = json['release_date'];
    this.title = json['title'];
    this.mediaType = json['media_type'];
    this.adult = json['adult'];
    this.video = json['video'];
    this.popularity = json['popularity'];
    this.id = json['id'];
    this.voteAverage = json['vote_average'];
    this.voteCount = json['vote_count'];

    List<dynamic> genreIdsList = json['genre_ids'];
    this.genreIds = new List();
    if (genreIdsList != null) {
      this.genreIds.addAll(genreIdsList.map((o) => int.tryParse(o.toString())));
    }
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
    data['media_type'] = this.mediaType;
    data['adult'] = this.adult;
    data['video'] = this.video;
    data['popularity'] = this.popularity;
    data['id'] = this.id;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['genre_ids'] = this.genreIds;
    return data;
  }
}
