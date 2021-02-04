///last collect 15/8/20
///check new form EasyTMDB.genre()
enum MovieGenres {
  Action,
  Adventure,
  Animation,
  Comedy,
  Crime,
  Documentary,
  Drama,
  Family,
  Fantasy,
  History,
  Horror,
  Music,
  Mystery,
  Romance,
  Science_Fiction,
  TV_Movie,
  Thriller,
  War,
  Western
}

extension normalize on MovieGenres {
  String get value {
    String rawValue = this.toString().toLowerCase().split('.').last;
    rawValue.replaceAll("_", " ");
    return rawValue;
  }
}
