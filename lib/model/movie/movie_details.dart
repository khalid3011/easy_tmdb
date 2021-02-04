import 'package:easytmdb/Model/genres.dart';
import 'package:easytmdb/Model/production_company.dart';
import 'package:easytmdb/Model/spoken_language.dart';

import '../production_country.dart';
import 'package:easytmdb/Helper/utils.dart';

class MovieDetails {
  String backdropPath;
  var belongsToCollection;
  String homepage;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String status;
  String tagline;
  String title;
  bool adult;
  bool video;
  var popularity;
  var voteAverage;
  int budget;
  int id;
  int revenue;
  int runtime;
  int voteCount;
  List<MovieDetailsGenres> genres;
  List<MovieDetailsProductionCompanies> productionCompanies;
  List<MovieDetailsProductionCountries> productionCountries;
  List<MovieDetailsSpokenLanguages> spokenLanguages;

  MovieDetails(
      {this.backdropPath,
      this.belongsToCollection,
      this.homepage,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.status,
      this.tagline,
      this.title,
      this.adult,
      this.video,
      this.popularity,
      this.voteAverage,
      this.budget,
      this.id,
      this.revenue,
      this.runtime,
      this.voteCount,
      this.genres,
      this.productionCompanies,
      this.productionCountries,
      this.spokenLanguages});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    this.belongsToCollection = json['belongs_to_collection'];
    this.homepage = json['homepage'];
    this.imdbId = json['imdb_id'];
    this.originalLanguage = json['original_language'];
    this.originalTitle = json['original_title'];
    this.overview = json['overview'];
    this.posterPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], true);
    this.backdropPath = Utils.userConditionalUrl(
        json['poster_path'], json['backdrop_path'], false);
    this.releaseDate = json['release_date'];
    this.status = json['status'];
    this.tagline = json['tagline'];
    this.title = json['title'];
    this.adult = json['adult'];
    this.video = json['video'];
    this.popularity = json['popularity'];
    this.voteAverage = json['vote_average'];
    this.budget = json['budget'];
    this.id = json['id'];
    this.revenue = json['revenue'];
    this.runtime = json['runtime'];
    this.voteCount = json['vote_count'];
    this.genres = (json['genres'] as List) != null
        ? (json['genres'] as List)
            .map((i) => MovieDetailsGenres.fromJson(i))
            .toList()
        : null;
    this.productionCompanies = (json['production_companies'] as List) != null
        ? (json['production_companies'] as List)
            .map((i) => MovieDetailsProductionCompanies.fromJson(i))
            .toList()
        : null;
    this.productionCountries = (json['production_countries'] as List) != null
        ? (json['production_countries'] as List)
            .map((i) => MovieDetailsProductionCountries.fromJson(i))
            .toList()
        : null;
    this.spokenLanguages = (json['spoken_languages'] as List) != null
        ? (json['spoken_languages'] as List)
            .map((i) => MovieDetailsSpokenLanguages.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['belongs_to_collection'] = this.belongsToCollection;
    data['homepage'] = this.homepage;
    data['imdb_id'] = this.imdbId;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['status'] = this.status;
    data['tagline'] = this.tagline;
    data['title'] = this.title;
    data['adult'] = this.adult;
    data['video'] = this.video;
    data['popularity'] = this.popularity;
    data['vote_average'] = this.voteAverage;
    data['budget'] = this.budget;
    data['id'] = this.id;
    data['revenue'] = this.revenue;
    data['runtime'] = this.runtime;
    data['vote_count'] = this.voteCount;
    data['genres'] = this.genres != null
        ? this.genres.map((i) => i.toJson()).toList()
        : null;
    data['production_companies'] = this.productionCompanies != null
        ? this.productionCompanies.map((i) => i.toJson()).toList()
        : null;
    data['production_countries'] = this.productionCountries != null
        ? this.productionCountries.map((i) => i.toJson()).toList()
        : null;
    data['spoken_languages'] = this.spokenLanguages != null
        ? this.spokenLanguages.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class MovieDetailsGenres extends Genres {
  MovieDetailsGenres.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class MovieDetailsProductionCompanies extends ProductionCompanies {
  MovieDetailsProductionCompanies.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}

class MovieDetailsProductionCountries extends ProductionCountries {
  MovieDetailsProductionCountries.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}

class MovieDetailsSpokenLanguages extends SpokenLanguages {
  MovieDetailsSpokenLanguages.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}
