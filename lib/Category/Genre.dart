import 'dart:convert';

import 'package:easytmdb/Helper/UrlMaker.dart';
import 'package:easytmdb/Helper/Utils.dart';
import 'package:easytmdb/Model/Genres.dart';
import 'package:http/http.dart' as http;

class Genre {
  Future<Genres> movie() async {
    final response = await http.get(UrlMaker.genreMovie());

    return Utils.isValidResponse(response)
        ? Genres.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<Genres> tv() async {
    final response = await http.get(UrlMaker.genreTv());

    return Utils.isValidResponse(response)
        ? Genres.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  ///last update 16-9-2020
  List<GenreDetails> movieWithourFetch() {
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
  List<GenreDetails> tvWithourFetch() {
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
