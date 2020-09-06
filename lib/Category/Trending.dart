import 'dart:convert';

import 'package:easytmdb/Helper/UrlMaker.dart';
import 'package:easytmdb/Helper/Utils.dart';
import 'package:easytmdb/Model/Trending/TrendingAll.dart';
import 'package:easytmdb/Model/Trending/TrendingMovie.dart';
import 'package:easytmdb/Model/Trending/TrendingPerson.dart';
import 'package:easytmdb/Model/Trending/TrendingTv.dart';
import 'package:http/http.dart' as http;

class Trending{
  Future<TrendingMovie> movieDay() async {
    var response = await http.get(UrlMaker.trendingMovieDay());

    return Utils.isValidResponse(response)
        ? TrendingMovie.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<TrendingMovie> movieWeek() async {
    var response = await http.get(UrlMaker.trendingMovieWeek());

    return Utils.isValidResponse(response)
        ? TrendingMovie.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<TrendingTv> tvDay() async {
    var response = await http.get(UrlMaker.trendingTvDay());

    return Utils.isValidResponse(response)
        ? TrendingTv.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<TrendingTv> tvWeek() async {
    var response = await http.get(UrlMaker.trendingTvWeek());

    return Utils.isValidResponse(response)
        ? TrendingTv.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

/*
//TODO run and solve error (solve later)
  Future<TrendingPerson> personDay() async {
    var response = await http.get(UrlMaker.trendingPersonDay());

    return Utils.isValidResponse(response)
        ? TrendingPerson.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

//TODO run and solve error (solve later)
  Future<TrendingPerson> personWeek() async {
    var response = await http.get(UrlMaker.trendingPersonWeek());

    return Utils.isValidResponse(response)
        ? TrendingPerson.fromJson(json.decode(response.body))
        : Utils.error(response);
  }
  */

  Future<TrendingAll> allDay() async {
    var response = await http.get(UrlMaker.trendingAllDay());

    return Utils.isValidResponse(response)
        ? TrendingAll.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<TrendingAll> allWeek() async {
    var response = await http.get(UrlMaker.trendingAllWeek());

    return Utils.isValidResponse(response)
        ? TrendingAll.fromJson(json.decode(response.body))
        : Utils.error(response);
  }
}