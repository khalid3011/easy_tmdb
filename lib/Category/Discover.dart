import 'dart:convert';


import 'package:easytmdb/Helper/UrlMaker.dart';
import 'package:easytmdb/Helper/Utils.dart';
import 'package:easytmdb/Model/Discover/DiscoverMovie.dart';
import 'package:easytmdb/Model/Discover/DiscoverTv.dart';
import 'package:http/http.dart' as http;

class Discover{
  Future<DiscoverMovie> movie(Map<String, dynamic> data) async {
    var response = await http.get(UrlMaker.discoverMovie(data));

    return Utils.isValidResponse(response)
        ? DiscoverMovie.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<DiscoverTv> tv(Map<String, dynamic> data) async {
    var response = await http.get(UrlMaker.discoverTv(data));

    return Utils.isValidResponse(response)
        ? DiscoverTv.fromJson(json.decode(response.body))
        : Utils.error(response);
  }
}