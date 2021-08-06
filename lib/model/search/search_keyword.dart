class SearchKeyword {
  int? page;
  int? totalPages;
  int? totalResults;
  List<SearchKeywordResults>? results;

  SearchKeyword({this.page, this.totalPages, this.totalResults, this.results});

  SearchKeyword.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalPages = json['total_pages'];
    this.totalResults = json['total_results'];
    this.results = (json['results'] as List?) != null
        ? (json['results'] as List)
            .map((i) => SearchKeywordResults.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    data['results'] = this.results != null
        ? this.results!.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class SearchKeywordResults {
  String? name;
  int? id;

  SearchKeywordResults({this.name, this.id});

  SearchKeywordResults.fromJson(Map<String, dynamic> json) {
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
