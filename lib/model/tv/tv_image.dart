import '../image_details.dart';

class TvImage {
  int id;
  List<TvImageBackdrops> backdrops;
  List<TvImagePosters> posters;

  TvImage({this.id, this.backdrops, this.posters});

  TvImage.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];

    this.backdrops = (json['backdrops'] as List) != null
        ? (json['backdrops'] as List)
            .map((i) => TvImageBackdrops.fromJson(i))
            .toList()
        : null;
    this.posters = (json['posters'] as List) != null
        ? (json['posters'] as List)
            .map((i) => TvImagePosters.fromJson(i))
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

class TvImageBackdrops extends ImageDetails {
  TvImageBackdrops.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class TvImagePosters extends ImageDetails {
  TvImagePosters.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
