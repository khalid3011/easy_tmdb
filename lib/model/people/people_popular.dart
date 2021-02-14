import 'package:easyTMDB/Helper/utils.dart';

class PeoplePopular {
  int page;
  int totalResults;
  int totalPages;
  List<PeoplePopularResults> results;

  PeoplePopular({this.page, this.totalResults, this.totalPages, this.results});

  PeoplePopular.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalResults = json['total_results'];
    this.totalPages = json['total_pages'];
    this.results = (json['results'] as List) != null
        ? (json['results'] as List)
            .map((i) => PeoplePopularResults.fromJson(i))
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

class PeoplePopularResults {
  String knownForDepartment;
  String profilePath;
  String name;
  bool adult;
  var popularity;
  int gender;
  int id;
  List<PeoplePopularResultsKnownFor> knownFor;

  PeoplePopularResults(
      {this.knownForDepartment,
      this.profilePath,
      this.name,
      this.adult,
      this.popularity,
      this.gender,
      this.id,
      this.knownFor});

  PeoplePopularResults.fromJson(Map<String, dynamic> json) {
    this.knownForDepartment = json['known_for_department'];
    this.profilePath = Utils.userConditionalUrl(
        json['profile_path'], "", true);
    this.name = json['name'];
    this.adult = json['adult'];
    this.popularity = json['popularity'];
    this.gender = json['gender'];
    this.id = json['id'];
    this.knownFor = (json['known_for'] as List) != null
        ? (json['known_for'] as List)
            .map((i) => PeoplePopularResultsKnownFor.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['known_for_department'] = this.knownForDepartment;
    data['profile_path'] = this.profilePath;
    data['name'] = this.name;
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

class PeoplePopularResultsKnownFor {
  String releaseDate;
  String mediaType;
  String title;
  String originalTitle;
  String originalLanguage;
  String backdropPath;
  String overview;
  String posterPath;
  bool video;
  bool adult;
  var voteAverage;
  int id;
  int voteCount;
  List<int> genreIds;

  PeoplePopularResultsKnownFor(
      {this.releaseDate,
      this.mediaType,
      this.title,
      this.originalTitle,
      this.originalLanguage,
      this.backdropPath,
      this.overview,
      this.posterPath,
      this.video,
      this.adult,
      this.voteAverage,
      this.id,
      this.voteCount,
      this.genreIds});

  PeoplePopularResultsKnownFor.fromJson(Map<String, dynamic> json) {
    this.releaseDate = json['release_date'];
    this.mediaType = json['media_type'];
    this.title = json['title'];
    this.originalTitle = json['original_title'];
    this.originalLanguage = json['original_language'];
    this.overview = json['overview'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.video = json['video'];
    this.adult = json['adult'];
    this.voteAverage = json['vote_average'];
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
    data['release_date'] = this.releaseDate;
    data['media_type'] = this.mediaType;
    data['title'] = this.title;
    data['original_title'] = this.originalTitle;
    data['original_language'] = this.originalLanguage;
    data['backdrop_path'] = this.backdropPath;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['video'] = this.video;
    data['adult'] = this.adult;
    data['vote_average'] = this.voteAverage;
    data['id'] = this.id;
    data['vote_count'] = this.voteCount;
    data['genre_ids'] = this.genreIds;
    return data;
  }
}
