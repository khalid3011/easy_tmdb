import 'package:easy_tmdb/Helper/utils.dart';

class Network {
  String name;
  String logoPath;
  String originCountry;
  int id;

  Network({this.name, this.logoPath, this.originCountry, this.id});

  Network.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.logoPath = Utils.userConditionalUrl(json['logo_path'], null, true);
    this.originCountry = json['origin_country'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['logo_path'] = this.logoPath;
    data['origin_country'] = this.originCountry;
    data['id'] = this.id;
    return data;
  }
}
