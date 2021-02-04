enum UserCreatedSortBy { created_at }

extension normalize on UserCreatedSortBy {
  String get asc {
    return this.toString().split('.').last.toLowerCase() + ".asc".trim();
  }

  String get desc {
    return this.toString().split('.').last.toLowerCase() + ".desc".trim();
  }
}
