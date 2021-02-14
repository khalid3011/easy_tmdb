import 'package:tmdb_easy/easyTMDB.dart';

main(List<String> args) {
  EasyTMDB easyTMDB = EasyTMDB("YOUR TMDB KEY");

  easyTMDB.movie().popular().then((value) {
    print(value.toJson());
  });

}
