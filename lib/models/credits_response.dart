

import 'dart:convert';

import 'package:peliculas_app_v2/models/models.dart';

class CreditsResponse{
    
    int id;
    List<CastResponse> cast;
    List<CastResponse> crew;

    CreditsResponse({
      required this.id,
      required this.cast,
      required this.crew
    });


  factory CreditsResponse.fromjson(String jsonBody){
    return CreditsResponse.fromMap(json.decode(jsonBody));
  }

  factory CreditsResponse.fromMap(Map<String,dynamic> json){
    return CreditsResponse(
      id    :  json['id'], 
      cast  : List<CastResponse>.from(json['cast'].map((x)=> CastResponse.fromMap(x))),
      crew  : List<CastResponse>.from(json['crew'].map((x)=> CastResponse.fromMap(x))));
  }



}