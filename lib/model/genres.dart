class Genres {
  List<GenreDetails> genres;

  Genres({this.genres});

  Genres.fromJson(Map<String, dynamic> json) {
    this.genres = (json['genres'] as List) != null
        ? (json['genres'] as List).map((i) => GenreDetails.fromJson(i)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genres'] = this.genres != null
        ? this.genres.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class GenreDetails {
  String name;
  int id;

  GenreDetails({this.name, this.id});

  GenreDetails.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
