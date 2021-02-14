import 'package:easyTMDB/Helper/utils.dart';

class ProductionCompanies {
  String logoPath;
  String name;
  String originCountry;
  int id;

  ProductionCompanies({this.logoPath, this.name, this.originCountry, this.id});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    this.logoPath = Utils.userConditionalUrl(json['logo_path'], null, true);
    this.name = json['name'];
    this.originCountry = json['origin_country'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    data['id'] = this.id;
    return data;
  }
}
