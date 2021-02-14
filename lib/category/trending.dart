import 'package:tmdb_easy/export/export_all.dart';

class Trending {
  Future<TrendingMovie> movieDay() async {
    final response = await Utils.fetchData(UrlMaker.trendingMovieDay());

    return TrendingMovie.fromJson(json.decode(response.body));
  }

  Future<TrendingMovie> movieWeek() async {
    final response = await Utils.fetchData(UrlMaker.trendingMovieWeek());

    return TrendingMovie.fromJson(json.decode(response.body));
  }

  Future<TrendingTv> tvDay() async {
    final response = await Utils.fetchData(UrlMaker.trendingTvDay());

    return TrendingTv.fromJson(json.decode(response.body));
  }

  Future<TrendingTv> tvWeek() async {
    final response = await Utils.fetchData(UrlMaker.trendingTvWeek());

    return TrendingTv.fromJson(json.decode(response.body));
  }

//upcoming version
/*
// run and solve error (solve later)
  Future<TrendingPerson> personDay() async {
    final response = await Utils.fetchData(UrlMaker.trendingPersonDay());

    return  TrendingPerson.fromJson(json.decode(response.body));
  }

//run and solve error (solve later)
  Future<TrendingPerson> personWeek() async {
    final response = await Utils.fetchData(UrlMaker.trendingPersonWeek());

    return  TrendingPerson.fromJson(json.decode(response.body));
  }
  */

  Future<TrendingAll> allDay() async {
    final response = await Utils.fetchData(UrlMaker.trendingAllDay());

    return TrendingAll.fromJson(json.decode(response.body));
  }

  Future<TrendingAll> allWeek() async {
    final response = await Utils.fetchData(UrlMaker.trendingAllWeek());

    return TrendingAll.fromJson(json.decode(response.body));
  }
}
