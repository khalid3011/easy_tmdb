class UserDetails {
  String? iso6391;
  String? iso31661;
  String? name;
  String? username;
  bool? includeAdult;
  int? id;
  Avatar? avatar;

  UserDetails(
      {this.iso6391,
      this.iso31661,
      this.name,
      this.username,
      this.includeAdult,
      this.id,
      this.avatar});

  UserDetails.fromJson(Map<String, dynamic> json) {
    this.iso6391 = json['iso_639_1'];
    this.iso31661 = json['iso_3166_1'];
    this.name = json['name'];
    this.username = json['username'];
    this.includeAdult = json['include_adult'];
    this.id = json['id'];
    this.avatar =
        json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    data['username'] = this.username;
    data['include_adult'] = this.includeAdult;
    data['id'] = this.id;
    if (this.avatar != null) {
      data['avatar'] = this.avatar!.toJson();
    }
    return data;
  }
}

class Avatar {
  Gravatar? gravatar;

  Avatar({this.gravatar});

  Avatar.fromJson(Map<String, dynamic> json) {
    this.gravatar =
        json['gravatar'] != null ? Gravatar.fromJson(json['gravatar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gravatar != null) {
      data['gravatar'] = this.gravatar!.toJson();
    }
    return data;
  }
}

class Gravatar {
  String? hash;

  Gravatar({this.hash});

  Gravatar.fromJson(Map<String, dynamic> json) {
    this.hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hash'] = this.hash;
    return data;
  }
}
