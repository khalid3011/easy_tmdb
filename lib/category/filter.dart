class Filter {
  static List _adultWordList = ["lesbian", "gay", "porn"];
  static bool containAdultWordList(String title) {
    for (int i = 0; i < _adultWordList.length; i++) {
      if (title.contains(_adultWordList[i])) {
        return true;
      }
    }
    return false;
  }
}
