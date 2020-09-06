enum TvSortBy {
  POPULARITY,
  FIRST_AIR_DATE,
  VOTE_AVERAGE
}

extension normalize on TvSortBy {
  String get ASC {
    return this.toString().split('.').last.toLowerCase()+".asc".trim();
  }

  String get DESC {
    return this.toString().split('.').last.toLowerCase()+".desc".trim();
  }
}
