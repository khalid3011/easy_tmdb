import 'dart:convert';

import 'package:easytmdb/Helper/UrlMaker.dart';
import 'package:easytmdb/Helper/Utils.dart';
import 'package:easytmdb/Model/People/PeopleDetails.dart';
import 'package:easytmdb/Model/People/PeopleImage.dart';
import 'package:easytmdb/Model/People/PeopleMovieCredits.dart';
import 'package:easytmdb/Model/People/PeoplePopular.dart';
import 'package:easytmdb/Model/People/PeopleTvCredits.dart';
import 'package:http/http.dart' as http;

class Peoples{
  Future<PeopleDetails> details(int personId) async {
    var response = await http.get(UrlMaker.peopleDetails(personId));

    return Utils.isValidResponse(response)
        ? PeopleDetails.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<PeopleImage> image(int personId) async {
    var response = await http.get(UrlMaker.peopleImage(personId));

    return Utils.isValidResponse(response)
        ? PeopleImage.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<PeopleMovieCredits> movieCredits(int personId) async {
    var response = await http.get(UrlMaker.peopleMovieCredits(personId));

    return Utils.isValidResponse(response)
        ? PeopleMovieCredits.fromJson(json.decode(response.body))
        : Utils.error(response);
  }

  Future<PeopleTvCredits> tvCredits(int personId) async {
    var response = await http.get(UrlMaker.peopleTvCredits(personId));

    return Utils.isValidResponse(response)
        ? PeopleTvCredits.fromJson(json.decode(response.body))
        : Utils.error(response);
  }


  Future<PeoplePopular> popular({int page, String language}) async {
    var response = await http.get(UrlMaker.peoplePopular(page, language));

    return Utils.isValidResponse(response)
        ? PeoplePopular.fromJson(json.decode(response.body))
        : Utils.error(response);
  }
}