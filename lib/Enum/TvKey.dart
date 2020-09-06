enum TvKey {
  LANGUAGE,
  SORT_BY,
  AIR_DATE_GTE,
  AIR_DATE_LTE,
  FIRST_AIR_DATE_GTE,
  FIRST_AIR_DATE_LTE,
  FIRST_AIR_DATE_YEAR,
  PAGE,
  TIMEZONE,
  VOTE_AVERAGE_GET,
  VOTE_COUNT_GTE,
  WITH_GENRES,
  WITHOUT_GENRES,
  WITH_KEYWORDS,
  WITHOUT_KEYWORDS,
  WITH_RUNTIME_GTE,
  WITH_RUNTIME_LTE,
  INCLUDE_NULL_FIRST_AIR_DATE,
  WITH_ORIGINAL_LANGUAGE,
  WITH_COMPANIES,
  SCREENED_THEATRICALLY,
  WITH_NETWORKS
}

extension normalize on TvKey {
  String get value {
    String rawValue = this.toString().toLowerCase().split('.').last;
    rawValue.replaceAll("_gte", ".gte");
    rawValue.replaceAll("_lte", ".lte");
    return rawValue;
  }
}
