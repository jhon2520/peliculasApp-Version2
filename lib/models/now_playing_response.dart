
import 'dart:convert';
import 'package:peliculas_app_v2/models/models.dart';


class NowPlayingResponse {

    int page;
    List<Movie> results;
    Dates dates;
    int totalPages;
    int totalResults;
  
    //Contructos con todo el esquema principal del json
    NowPlayingResponse({
      required this.page,
      required this.results,
      required this.dates,
      required this.totalPages,
      required this.totalResults,
    });

    factory NowPlayingResponse.fronJson(String str) {
      return NowPlayingResponse.fromMap(json.decode(str));
    }


    factory NowPlayingResponse.fromMap(Map<String, dynamic> json)
    {
      return NowPlayingResponse(
        dates         : Dates.fromMap(json["dates"]),
        page          : json["page"],
        results       : List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages    : json["total_pages"],
        totalResults  : json["total_results"],
    );
    }

}

class Dates {

    DateTime maximum;
    DateTime minimum;

    Dates({
      required  this.maximum,
      required  this.minimum,
    });


    factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

}
