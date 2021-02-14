import 'package:easy_tmdb/Model/production_country.dart';

import '../genres.dart';
import '../production_company.dart';
import 'package:easy_tmdb/Helper/utils.dart';

class MovieLatest {
  bool adult;
  String backdropPath;
  var belongsToCollection;
  int budget;
  List<MovieLatestGenres> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  var popularity;
  String posterPath;
  List<MovieLatestProductionCompanies> productionCompanies;
  List<MovieLatestProductionCountries> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<String> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  var voteAverage;
  int voteCount;

  MovieLatest(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  MovieLatest.fromJson(Map<String, dynamic> json) {
    this.adult = json['adult'];
    this.belongsToCollection = json['belongs_to_collection'];
    this.budget = json['budget'];
    this.genres = (json['genres'] as List)
        .map((i) => MovieLatestGenres.fromJson(i))
        .toList();
    this.homepage = json['homepage'];
    this.id = json['id'];
    this.imdbId = json['imdb_id'];
    this.originalLanguage = json['original_language'];
    this.originalTitle = json['original_title'];
    this.overview = json['overview'];
    this.popularity = json['popularity'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.productionCompanies = (json['production_companies'] as List)
        .map((i) => MovieLatestProductionCompanies.fromJson(i))
        .toList();
    this.productionCountries = (json['production_countries'] as List)
        .map((i) => MovieLatestProductionCountries.fromJson(i))
        .toList();
    this.releaseDate = json['release_date'];
    this.revenue = json['revenue'];
    this.runtime = json['runtime'];

    List<dynamic> languagesList = json['spoken_languages'];
    this.spokenLanguages = new List();
    this.spokenLanguages.addAll(languagesList.map((o) => o.toString()));

    this.status = json['status'];
    this.tagline = json['tagline'];
    this.title = json['title'];
    this.video = json['video'];
    this.voteAverage = json['vote_average'];
    this.voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['budget'] = this.budget;
    data['homepage'] = this.homepage;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['release_date'] = this.releaseDate;
    data['revenue'] = this.revenue;
    data['runtime'] = this.runtime;
    data['status'] = this.status;
    data['tagline'] = this.tagline;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['backdrop_path'] = this.backdropPath;
    data['imdbId'] = this.imdbId;
    data['poster_path'] = this.posterPath;
    data['spoken_languages'] = this.spokenLanguages;
    if (this.belongsToCollection != null) {
      data['belongs_to_collection'] = this.belongsToCollection.toJson();
    }
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    if (this.productionCompanies != null) {
      data['production_companies'] =
          this.productionCompanies.map((v) => v.toJson()).toList();
    }
    if (this.productionCountries != null) {
      data['production_countries'] =
          this.productionCountries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieLatestGenres extends Genres {
  MovieLatestGenres.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class MovieLatestProductionCompanies extends ProductionCompanies {
  MovieLatestProductionCompanies.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}

class MovieLatestProductionCountries extends ProductionCountries {
  MovieLatestProductionCountries.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}
