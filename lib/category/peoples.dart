import 'package:tmdb_easy/export/export_all.dart';

class Peoples {
  Future<PeopleDetails> details(int personId) async {
    final response = await Utils.fetchData(UrlMaker.peopleDetails(personId));

    return PeopleDetails.fromJson(json.decode(response.body));
  }

  Future<PeopleImage> image(int personId) async {
    final response = await Utils.fetchData(UrlMaker.peopleImage(personId));

    return PeopleImage.fromJson(json.decode(response.body));
  }

  Future<PeopleMovieCredits> movieCredits(int personId) async {
    final response =
        await Utils.fetchData(UrlMaker.peopleMovieCredits(personId));

    return PeopleMovieCredits.fromJson(json.decode(response.body));
  }

  Future<PeopleTvCredits> tvCredits(int personId) async {
    final response = await Utils.fetchData(UrlMaker.peopleTvCredits(personId));

    return PeopleTvCredits.fromJson(json.decode(response.body));
  }

  Future<PeoplePopular> popular({int? page, String? language}) async {
    final response =
        await Utils.fetchData(UrlMaker.peoplePopular(page, language));

    return PeoplePopular.fromJson(json.decode(response.body));
  }
}
