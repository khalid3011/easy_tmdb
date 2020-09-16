enum PosterSizes {
  w92,
  w154,
  w185,
  w342,
  w500,
  w780,
  original,
}

extension normalizePoster on PosterSizes {
  String get name {
    return this.toString().split('.').last;
  }
}

enum LogoSizes {
  w45,
  w92,
  w154,
  w185,
  w300,
  w500,
  original,
}

extension normalizeLogo on LogoSizes {
  String get name {
    return this.toString().split('.').last;
  }
}

enum BackdropSizes {
  w185,
  w300,
  w780,
  original,
}

extension normalizeBackdrop on BackdropSizes {
  String get name {
    return this.toString().split('.').last;
  }
}

enum ProfileSizes {
  w45,
  w185,
  w632,
  original,
}

extension normalizeProfile on ProfileSizes {
  String get name {
    return this.toString().split('.').last;
  }
}

enum StillSizes {
  w92,
  w185,
  w300,
  original,
}

extension normalizeStill on StillSizes {
  String get name {
    return this.toString().split('.').last;
  }
}
