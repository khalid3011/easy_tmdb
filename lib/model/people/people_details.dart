import 'package:easytmdb/helper/utils.dart';

class PeopleDetails {
  String birthday;
  String knownForDepartment;
  String deathday;
  String name;
  String biography;
  String placeOfBirth;
  String profilePath;
  String imdbId;
  String homepage;
  bool adult;
  var popularity;
  int id;
  int gender;
  List<String> alsoKnownAs;

  PeopleDetails(
      {this.birthday,
      this.knownForDepartment,
      this.deathday,
      this.name,
      this.biography,
      this.placeOfBirth,
      this.profilePath,
      this.imdbId,
      this.homepage,
      this.adult,
      this.popularity,
      this.id,
      this.gender,
      this.alsoKnownAs});

  PeopleDetails.fromJson(Map<String, dynamic> json) {
    this.birthday = json['birthday'];
    this.knownForDepartment = json['known_for_department'];
    this.deathday = json['deathday'];
    this.name = json['name'];
    this.biography = json['biography'];
    this.placeOfBirth = json['place_of_birth'];
    this.profilePath = Utils.userConditionalUrl(
        json['profile_path'], "", true);
    this.imdbId = json['imdb_id'];
    this.homepage = json['homepage'];
    this.adult = json['adult'];
    this.popularity = json['popularity'];
    this.id = json['id'];
    this.gender = json['gender'];

    List<dynamic> alsoKnownAsList = json['also_known_as'];
    this.alsoKnownAs = new List();
    this.alsoKnownAs.addAll(alsoKnownAsList.map((o) => o.toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthday'] = this.birthday;
    data['known_for_department'] = this.knownForDepartment;
    data['deathday'] = this.deathday;
    data['name'] = this.name;
    data['biography'] = this.biography;
    data['place_of_birth'] = this.placeOfBirth;
    data['profile_path'] = this.profilePath;
    data['imdb_id'] = this.imdbId;
    data['homepage'] = this.homepage;
    data['adult'] = this.adult;
    data['popularity'] = this.popularity;
    data['id'] = this.id;
    data['gender'] = this.gender;
    data['also_known_as'] = this.alsoKnownAs;
    return data;
  }
}
