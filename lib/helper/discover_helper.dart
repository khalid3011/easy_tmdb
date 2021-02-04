class DiscoverHelper {
  getMovieKeys() {
    var movieKeys = {
      "LANGUAGE": "language",
      "REGION": "region",
      "SORT_BY": "sort_by",
      "CERTIFICATION_COUNTRY": "certification_country",
      "CERTIFICATION": "certification",
      "CERTIFICATION_LTE": "certification.lte",
      "CERTIFICATION_GTE": "certification.gte",
      "INCLUDE_ADULT": "include_adult",
      "INCLUDE_VIDEO": "include_video",
      "PAGE": "page",
      "PRIMARY_RELEASE_YEAR": "primary_release_year",
      "PRIMARY_RELEASE_DATE_GTE": "primary_release_date.gte",
      "PRIMARY_RELEASE_DATE_LTE": "primary_release_date.lte",
      "RELEASE_DATE_GTE": "release_date.gte",
      "RELEASE_DATE_LTE": "release_date.lte",
      "WITH_REALISE_TYPE": "with_release_type",
      "YEAR": "year",
      "VOTE_COUNT_GTE": "vote_count.gte",
      "VOTE_COUNT_LTE": "vote_count.lte",
      "VOTE_AVERAGE_GET": "vote_average.gte",
      "VOTE_AVERAGE_LTE": "vote_average.lte",
      "WITH_CAST": "with_cast",
      "WITH_CREW": "with_crew",
      "WITH_PEOPLE": "with_people",
      "WITH_COMPANIES": "with_companies",
      "WITH_GENRES": "with_genres",
      "WITHOUT_GENRES": "without_genres",
      "WITH_KEYWORDS": "with_keywords",
      "WITHOUT_KEYWORDS": "without_keywords",
      "WITH_RUNTIME_GTE": "with_runtime.gte",
      "WITH_RUNTIME_LTE": "with_runtime.lte",
      "WITH_ORIGINAL_LANGUAGE": "with_original_language"
    };

    return movieKeys;
  }

  getTvKeys() {
    var tvKeys = {
      "LANGUAGE": "language",
      "SORT_BY": "sort_by",
      "AIR_DATE_GTE": "air_date.gte",
      "AIR_DATE_LTE": "air_date.lte",
      "FIRST_AIR_DATE_GTE": "first_air_date.gte",
      "FIRST_AIR_DATE_LTE": "first_air_date.lte",
      "FIRST_AIR_DATE_YEAR": "first_air_date_year",
      "PAGE": "page",
      "TIMEZONE": "timezone",
      "VOTE_AVERAGE_GET": "vote_average.gte",
      "VOTE_COUNT_GTE": "vote_count.gte",
      "WITH_GENRES": "with_genres",
      "WITHOUT_GENRES": "without_genres",
      "WITH_KEYWORDS": "with_keywords",
      "WITHOUT_KEYWORDS": "without_keywords",
      "WITH_RUNTIME_GTE": "with_runtime.gte",
      "WITH_RUNTIME_LTE": "with_runtime.lte",
      "INCLUDE_NULL_FIRST_AIR_DATE": "include_null_first_air_dates",
      "WITH_ORIGINAL_LANGUAGE": "with_original_language",
      "WITH_COMPANIES": "with_companies",
      "SCREENED_THEATRICALLY": "screened_theatrically",
      "WITH_NETWORKS": "with_networks"
    };

    return tvKeys;
  }
}
