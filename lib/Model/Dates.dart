class Dates {
  String maximum;
  String minimum;

  Dates({this.maximum, this.minimum});

  Dates.fromJson(Map<String, dynamic> json) {
    this.maximum = json['maximum'];
    this.minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maximum'] = this.maximum;
    data['minimum'] = this.minimum;
    return data;
  }
}