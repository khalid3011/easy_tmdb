import 'package:easyTMDB/Model/image_details.dart';

class PeopleImage {
  int id;
  List<PeopleImageProfiles> profiles;

  PeopleImage({this.id, this.profiles});

  PeopleImage.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.profiles = (json['profiles'] as List) != null
        ? (json['profiles'] as List)
            .map((i) => PeopleImageProfiles.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profiles'] = this.profiles != null
        ? this.profiles.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class PeopleImageProfiles extends ImageDetails {
  PeopleImageProfiles.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}
