///last collect 15/8/20
///check new form EasyTMDB.genre()
enum TvGenres{
  Action_Adventure,
  Animation,
  Comedy,
  Crime,
  Documentary,
  Drama,
  Family,
  Kids,
  Mystery,
  News,
  Reality,
  Sci_Fi_Fantasy,
  Soap,
  Talk,
  War_Politics,
  Western
}

extension normalize on TvGenres {
  String get value {
    String rawValue = this.toString().toLowerCase().split('.').last;
    rawValue.replaceAll("_", " ");
    return rawValue;
  }
}
