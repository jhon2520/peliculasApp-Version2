

import 'dart:convert';

import 'package:peliculas_app_v2/models/models.dart';

class PopularMoviesResponse{

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;


  PopularMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults
  });


  factory PopularMoviesResponse.fromJson(String body){
    return PopularMoviesResponse.fromMap(json.decode(body));
  }

  factory PopularMoviesResponse.fromMap(Map<String,dynamic> json){
    return PopularMoviesResponse(
      page         : json['page'],
      results      : List<Movie>.from(json['results'].map((x)=> Movie.fromMap(x))),
      totalPages   : json['total_pages'],
      totalResults : json['total_pages'],

    );
  }



}