class Video {
  int id;
  List<ResultsListBean> results;

  Video({this.id, this.results});

  Video.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.results = (json['results'] as List) != null
        ? (json['results'] as List)
            .map((i) => ResultsListBean.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['results'] = this.results != null
        ? this.results.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class ResultsListBean {
  String id;
  String iso6391;
  String iso31661;
  String key;
  String name;
  String site;
  String type;
  int size;

  ResultsListBean(
      {this.id,
      this.iso6391,
      this.iso31661,
      this.key,
      this.name,
      this.site,
      this.type,
      this.size});

  ResultsListBean.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.iso6391 = json['iso_639_1'];
    this.iso31661 = json['iso_3166_1'];
    this.key = json['key'];
    this.name = json['name'];
    this.site = json['site'];
    this.type = json['type'];
    this.size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['iso_639_1'] = this.iso6391;
    data['iso_3166_1'] = this.iso31661;
    data['key'] = this.key;
    data['name'] = this.name;
    data['site'] = this.site;
    data['type'] = this.type;
    data['size'] = this.size;
    return data;
  }
}
