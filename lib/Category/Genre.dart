import 'dart:convert';

import 'package:easytmdb/Helper/UrlMaker.dart';
import 'package:easytmdb/Helper/Utils.dart';
import 'package:easytmdb/Model/Genres.dart';
import 'package:http/http.dart' as http;

class Genre{
  Future<Genres> movie() async {
    var response = await http.get(UrlMaker.genreMovie());

    return Utils.isValidResponse(response)
        ? Genres.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<Genres> tv() async {
    var response = await http.get(UrlMaker.genreTv());

    return Utils.isValidResponse(response)
        ? Genres.fromJson(json.decode(response.body))
        : Utils.error(response);
  }
}