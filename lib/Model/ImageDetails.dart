class ImageDetails {
  String iso6391;
  String filePath;
  var voteAverage;
  double aspectRatio;
  int width;
  int height;
  int voteCount;

  ImageDetails({this.iso6391, this.filePath, this.voteAverage, this.aspectRatio, this.width, this.height, this.voteCount});

  ImageDetails.fromJson(Map<String, dynamic> json) {
    this.iso6391 = json['iso_639_1'];
    this.filePath = json['file_path'];
    this.voteAverage = json['vote_average'];
    this.aspectRatio = json['aspect_ratio'];
    this.width = json['width'];
    this.height = json['height'];
    this.voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['file_path'] = this.filePath;
    data['vote_average'] = this.voteAverage;
    data['aspect_ratio'] = this.aspectRatio;
    data['width'] = this.width;
    data['height'] = this.height;
    data['vote_count'] = this.voteCount;
    return data;
  }
}