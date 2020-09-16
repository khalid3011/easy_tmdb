import 'dart:convert';

import 'package:easytmdb/Helper/UrlMaker.dart';
import 'package:easytmdb/Helper/Utils.dart';
import 'package:easytmdb/Model/Trending/TrendingAll.dart';
import 'package:easytmdb/Model/Trending/TrendingMovie.dart';
import 'package:easytmdb/Model/Trending/TrendingTv.dart';
import 'package:http/http.dart' as http;

class Trending {
  Future<TrendingMovie> movieDay() async {
    final response = await http.get(UrlMaker.trendingMovieDay());

    return Utils.isValidResponse(response)
        ? TrendingMovie.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<TrendingMovie> movieWeek() async {
    final response = await http.get(UrlMaker.trendingMovieWeek());

    return Utils.isValidResponse(response)
        ? TrendingMovie.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<TrendingTv> tvDay() async {
    final response = await http.get(UrlMaker.trendingTvDay());

    return Utils.isValidResponse(response)
        ? TrendingTv.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<TrendingTv> tvWeek() async {
    final response = await http.get(UrlMaker.trendingTvWeek());

    return Utils.isValidResponse(response)
        ? TrendingTv.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

//upcoming version
/*
// run and solve error (solve later)
  Future<TrendingPerson> personDay() async {
    final response = await http.get(UrlMaker.trendingPersonDay());

    return Utils.isValidResponse(response)
        ? TrendingPerson.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

//run and solve error (solve later)
  Future<TrendingPerson> personWeek() async {
    final response = await http.get(UrlMaker.trendingPersonWeek());

    return Utils.isValidResponse(response)
        ? TrendingPerson.fromJson(json.decode(response.body))
        : Utils.error(response);
  }
  */

  Future<TrendingAll> allDay() async {
    final response = await http.get(UrlMaker.trendingAllDay());

    return Utils.isValidResponse(response)
        ? TrendingAll.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<TrendingAll> allWeek() async {
    final response = await http.get(UrlMaker.trendingAllWeek());

    return Utils.isValidResponse(response)
        ? TrendingAll.fromJson(json.decode(response.body))
        : Utils.error(response);
  }
}
