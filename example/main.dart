import 'package:easytmdb/EasyTMDB.dart';

main(List<String> args) {
  EasyTMDB easyTMDB = EasyTMDB("8de4c0b542809d69925bd0d2de3c2974");

  easyTMDB.movie().popular().then((value) {
    print(value.toJson());
  });
}
