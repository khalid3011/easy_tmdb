import '../ImageDetails.dart';

class MovieImage {
  int id;
  List<MovieImageBackdrops> backdrops;
  List<MovieImagePosters> posters;

  MovieImage({this.id, this.backdrops, this.posters});

  MovieImage.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];

    this.backdrops = (json['backdrops'] as List) != null
        ? (json['backdrops'] as List)
            .map((i) => MovieImageBackdrops.fromJson(i))
            .toList()
        : null;
    this.posters = (json['posters'] as List) != null
        ? (json['posters'] as List)
            .map((i) => MovieImagePosters.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['backdrops'] = this.backdrops != null
        ? this.backdrops.map((i) => i.toJson()).toList()
        : null;
    data['posters'] = this.posters != null
        ? this.posters.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class MovieImageBackdrops extends ImageDetails {
  MovieImageBackdrops.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}

class MovieImagePosters extends ImageDetails {
  MovieImagePosters.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
