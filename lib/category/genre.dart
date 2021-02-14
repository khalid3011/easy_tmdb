import 'package:easyTMDB/export/export_all.dart';

class Genre {
  Future<Genres> movie() async {
    final response = await Utils.fetchData(UrlMaker.genreMovie());

    return Genres.fromJson(json.decode(response.body));
  }

  Future<Genres> tv() async {
    final response = await Utils.fetchData(UrlMaker.genreTv());

    return Genres.fromJson(json.decode(response.body));
  }

  ///last update 16-9-2020
  List<GenreDetails> movieWithoutFetch() {
    List<GenreDetails> tempList = List();

    tempList.add(GenreDetails(id: 28, name: "Action"));
    tempList.add(GenreDetails(id: 12, name: "Adventure"));
    tempList.add(GenreDetails(id: 16, name: "Animation"));
    tempList.add(GenreDetails(id: 35, name: "Comedy"));
    tempList.add(GenreDetails(id: 80, name: "Crime"));
    tempList.add(GenreDetails(id: 99, name: "Documentary"));
    tempList.add(GenreDetails(id: 18, name: "Drama"));
    tempList.add(GenreDetails(id: 10751, name: "Family"));
    tempList.add(GenreDetails(id: 14, name: "Fantasy"));
    tempList.add(GenreDetails(id: 36, name: "History"));
    tempList.add(GenreDetails(id: 27, name: "Horror"));
    tempList.add(GenreDetails(id: 10402, name: "Music"));
    tempList.add(GenreDetails(id: 9648, name: "Mystery"));
    tempList.add(GenreDetails(id: 10749, name: "Romance"));
    tempList.add(GenreDetails(id: 878, name: "Science Fiction"));
    tempList.add(GenreDetails(id: 10770, name: "TV Movie"));
    tempList.add(GenreDetails(id: 53, name: "Thriller"));
    tempList.add(GenreDetails(id: 10752, name: "War"));
    tempList.add(GenreDetails(id: 37, name: "Western"));

    return tempList;
  }

  ///last update 16-9-2020
  List<GenreDetails> tvWithoutFetch() {
    List<GenreDetails> tempList = List();

    tempList.add(GenreDetails(id: 10759, name: "Action & Adventure"));
    tempList.add(GenreDetails(id: 16, name: "Animation"));
    tempList.add(GenreDetails(id: 35, name: "Comedy"));
    tempList.add(GenreDetails(id: 80, name: "Crime"));
    tempList.add(GenreDetails(id: 99, name: "Documentary"));
    tempList.add(GenreDetails(id: 18, name: "Drama"));
    tempList.add(GenreDetails(id: 10751, name: "Family"));
    tempList.add(GenreDetails(id: 10762, name: "Kids"));
    tempList.add(GenreDetails(id: 9648, name: "Mystery"));
    tempList.add(GenreDetails(id: 10763, name: "News"));
    tempList.add(GenreDetails(id: 10764, name: "Reality"));
    tempList.add(GenreDetails(id: 10765, name: "Sci-Fi & Fantasy"));
    tempList.add(GenreDetails(id: 10766, name: "Soap"));
    tempList.add(GenreDetails(id: 10767, name: "Talk"));
    tempList.add(GenreDetails(id: 10768, name: "War & Politics"));
    tempList.add(GenreDetails(id: 37, name: "Western"));

    return tempList;
  }
}
