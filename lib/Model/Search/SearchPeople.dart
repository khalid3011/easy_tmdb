import 'package:easytmdb/Helper/Utils.dart';

class SearchPeople {
  int page;
  int totalResults;
  int totalPages;
  List<SearchPeopleResults> results;

  SearchPeople({this.page, this.totalResults, this.totalPages, this.results});

  SearchPeople.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalResults = json['total_results'];
    this.totalPages = json['total_pages'];
    this.results = (json['results'] as List) != null
        ? (json['results'] as List)
            .map((i) => SearchPeopleResults.fromJson(i))
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

class SearchPeopleResults {
  String knownForDepartment;
  String name;
  String profilePath;
  bool adult;
  var popularity;
  int id;
  int gender;
  List<SearchPeopleResultsKnownFor> knownFor;

  SearchPeopleResults(
      {this.knownForDepartment,
      this.name,
      this.profilePath,
      this.adult,
      this.popularity,
      this.id,
      this.gender,
      this.knownFor});

  SearchPeopleResults.fromJson(Map<String, dynamic> json) {
    this.knownForDepartment = json['known_for_department'];
    this.name = json['name'];
    this.profilePath =
        Utils.userConditionalUrl(json['profile_path'], null, true);
    this.adult = json['adult'];
    this.popularity = json['popularity'];
    this.id = json['id'];
    this.gender = json['gender'];
    this.knownFor = (json['known_for'] as List) != null
        ? (json['known_for'] as List)
            .map((i) => SearchPeopleResultsKnownFor.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['known_for_department'] = this.knownForDepartment;
    data['name'] = this.name;
    data['profile_path'] = this.profilePath;
    data['adult'] = this.adult;
    data['popularity'] = this.popularity;
    data['id'] = this.id;
    data['gender'] = this.gender;
    data['known_for'] = this.knownFor != null
        ? this.knownFor.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class SearchPeopleResultsKnownFor {
  String posterPath;
  String mediaType;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  String title;
  String overview;
  String releaseDate;
  bool video;
  bool adult;
  var voteAverage;
  int voteCount;
  int id;
  List<int> genreIds;

  SearchPeopleResultsKnownFor(
      {this.posterPath,
      this.mediaType,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.title,
      this.overview,
      this.releaseDate,
      this.video,
      this.adult,
      this.voteAverage,
      this.voteCount,
      this.id,
      this.genreIds});

  SearchPeopleResultsKnownFor.fromJson(Map<String, dynamic> json) {
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.mediaType = json['media_type'];
    this.originalLanguage = json['original_language'];
    this.originalTitle = json['original_title'];
    this.title = json['title'];
    this.overview = json['overview'];
    this.releaseDate = json['release_date'];
    this.video = json['video'];
    this.adult = json['adult'];
    this.voteAverage = json['vote_average'];
    this.voteCount = json['vote_count'];
    this.id = json['id'];

    List<dynamic> genreIdsList = json['genre_ids'];
    this.genreIds = new List();
    if (genreIdsList != null) {
      this.genreIds.addAll(genreIdsList.map((o) => int.tryParse(o.toString())));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poster_path'] = this.posterPath;
    data['media_type'] = this.mediaType;
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['title'] = this.title;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['video'] = this.video;
    data['adult'] = this.adult;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['id'] = this.id;
    data['genre_ids'] = this.genreIds;
    return data;
  }
}
