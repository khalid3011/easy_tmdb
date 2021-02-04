import 'package:easytmdb/Helper/utils.dart';

class UserCreatedList {
  int page;
  int totalPages;
  int totalResults;
  List<UserCreatedListResults> results;

  UserCreatedList(
      {this.page, this.totalPages, this.totalResults, this.results});

  UserCreatedList.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalPages = json['total_pages'];
    this.totalResults = json['total_results'];
    this.results = (json['results'] as List) != null
        ? (json['results'] as List)
            .map((i) => UserCreatedListResults.fromJson(i))
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

class UserCreatedListResults {
  String description;
  String iso6391;
  String listType;
  String name;
  String posterPath;
  int favoriteCount;
  int id;
  int itemCount;

  UserCreatedListResults(
      {this.description,
      this.iso6391,
      this.listType,
      this.name,
      this.posterPath,
      this.favoriteCount,
      this.id,
      this.itemCount});

  UserCreatedListResults.fromJson(Map<String, dynamic> json) {
    this.description = json['description'];
    this.iso6391 = json['iso_639_1'];
    this.listType = json['list_type'];
    this.name = json['name'];
    this.posterPath = Utils.userConditionalUrl(json['poster_path'], null, true);
    this.favoriteCount = json['favorite_count'];
    this.id = json['id'];
    this.itemCount = json['item_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['iso_639_1'] = this.iso6391;
    data['list_type'] = this.listType;
    data['name'] = this.name;
    data['poster_path'] = this.posterPath;
    data['favorite_count'] = this.favoriteCount;
    data['id'] = this.id;
    data['item_count'] = this.itemCount;
    return data;
  }
}
