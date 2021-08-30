


import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app_v2/models/credits_response.dart';
import 'package:peliculas_app_v2/models/models.dart';

class CreditsProvider extends ChangeNotifier{

  String _authority = "api.themoviedb.org";
  String _apiKey = "a27fc2203f51a1bb39546fb877cdac6a";
  String _language = "es-Es";
  //variable que va a tener, según la llave, el valor de una lista de actores
  Map<int, List<CastResponse>> movieCast = {};


  Future<List<CastResponse>> getCast(String idMovie) async{

    final url = Uri.https(_authority, '3/movie/$idMovie/credits',{
      
      'api_key'   : _apiKey,
      'language'  : _language

    });

    //Valodación para no volver a hacer la petición de actores. 
    //si el mapa ya tiene la llave de una película abierta entonces se cargan los actores
    //del mapa y no se hace otra petición
    if(movieCast.containsKey(int.parse(idMovie))) return movieCast[idMovie]!;

      print("Pidiendo información al servidor");

      final response = await http.get(url);
      final CreditsResponse castResponse = CreditsResponse.fromjson(response.body);
      this.movieCast[int.parse(idMovie)] = castResponse.cast;
      notifyListeners();
      return castResponse.cast;

      // print("Cast");
      // print(castList[0].name); 
      // print("Crew");
      // print(crewList[0].name); 
  }


}