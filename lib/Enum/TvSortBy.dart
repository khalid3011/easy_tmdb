enum TvSortBy { POPULARITY, FIRST_AIR_DATE, VOTE_AVERAGE }

extension normalize on TvSortBy {
  String get asc {
    return this.toString().split('.').last.toLowerCase() + ".asc".trim();
  }

  String get desc {
    return this.toString().split('.').last.toLowerCase() + ".desc".trim();
  }
}
