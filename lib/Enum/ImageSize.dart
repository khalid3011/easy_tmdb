enum ImageSize{
  w92, w154, w185, w342, w500, w780, original
}

extension toString on ImageSize{
  String get size {
    return this.toString().split('.').last;
  }
}