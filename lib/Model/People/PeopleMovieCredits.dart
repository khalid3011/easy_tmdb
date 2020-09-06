import 'package:easytmdb/Model/Cast.dart';
import 'package:easytmdb/Model/Crew.dart';

class PeopleMovieCredits {
  int id;
  List<PeopleMovieCreditsCast> cast;
  List<PeopleMovieCreditsCrew> crew;

  PeopleMovieCredits({this.id, this.cast, this.crew});

  PeopleMovieCredits.fromJson(Map<String, dynamic> json) {    
    this.id = json['id'];
    this.cast = (json['cast'] as List)!=null?(json['cast'] as List).map((i) => PeopleMovieCreditsCast.fromJson(i)).toList():null;
    this.crew = (json['crew'] as List)!=null?(json['crew'] as List).map((i) => PeopleMovieCreditsCrew.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cast'] = this.cast != null?this.cast.map((i) => i.toJson()).toList():null;
    data['crew'] = this.crew != null?this.crew.map((i) => i.toJson()).toList():null;
    return data;
  }

}

class PeopleMovieCreditsCast extends Cast{
  PeopleMovieCreditsCast.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class PeopleMovieCreditsCrew extends Crew{
  PeopleMovieCreditsCrew.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
