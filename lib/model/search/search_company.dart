import 'package:easy_tmdb/Helper/utils.dart';

class SearchCompany {
  int page;
  int totalPages;
  int totalResults;
  List<SearchCompanyResults> results;

  SearchCompany({this.page, this.totalPages, this.totalResults, this.results});

  SearchCompany.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalPages = json['total_pages'];
    this.totalResults = json['total_results'];
    this.results = (json['results'] as List) != null
        ? (json['results'] as List)
            .map((i) => SearchCompanyResults.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    data['results'] = this.results != null
        ? this.results.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class SearchCompanyResults {
  String logoPath;
  String name;
  String originCountry;
  int id;

  SearchCompanyResults({this.logoPath, this.name, this.originCountry, this.id});

  SearchCompanyResults.fromJson(Map<String, dynamic> json) {
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
