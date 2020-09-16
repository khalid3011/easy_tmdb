enum ExternalSource {
  imdb_id
  /*freebase_mid,
  freebase_id,
  tvdb_id,
  tvrage_id,
  facebook_id,
  twitter_id,
  instagram_id*/
}

extension normalize on ExternalSource {
  String get name {
    return this.toString().split('.').last;
  }
}
