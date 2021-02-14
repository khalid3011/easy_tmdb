enum MediaType{
  Movie,
  Tv,
}

extension mtvalue on MediaType {
  String get name {
    return this.toString().split('.').last.toLowerCase();
  }
}