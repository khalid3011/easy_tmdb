class ImageSize {
  PosterSize posterSize() => PosterSize();
  LogoSize logoSize() => LogoSize();
  BackdropSize backdropSize() => BackdropSize();
  ProfileSize profileSize() => ProfileSize();
  StillSize stillSize() => StillSize();
}

class PosterSize {
  String get w92 => "w92";
  String get w154 => "w154";
  String get w185 => "w185";
  String get w500 => "w500";
  String get w780 => "w780";
  String get original => "original";
}

class LogoSize {
  String get w45 => "w45";
  String get w92 => "w92";
  String get w154 => "w154";
  String get w185 => "w185";
  String get w300 => "w300";
  String get w500 => "w500";
  String get original => "original";
}

class BackdropSize {
  String get w185 => "w185";
  String get w300 => "w300";
  String get w780 => "w780";
  String get original => "original";
}

class ProfileSize {
  String get w45 => "w45";
  String get w185 => "w185";
  String get w632 => "w632";
  String get original => "original";
}

class StillSize {
  String get w92 => "w92";
  String get w185 => "w185";
  String get w300 => "w300";
  String get original => "original";
}
