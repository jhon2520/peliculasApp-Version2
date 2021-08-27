
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app_v2/models/models.dart';
import 'package:peliculas_app_v2/models/popular_response.dart';

class PopularProvider extends ChangeNotifier{

  String _authority         = "api.themoviedb.org";
  String _unencodedPath     = "3/movie/popular";
  String _apiKey            = "a27fc2203f51a1bb39546fb877cdac6a";
  String _language          = "es-ES";
  List<Movie> popularList   = [];


  PopularProvider(){
    this.getPopulares();
  }


  void getPopulares()async {

    final url = Uri.https(_authority, _unencodedPath, {

      'api_key': _apiKey,
      'language': _language,
    });

    final response = await http.get(url);
    final PopularMoviesResponse popularMovies = PopularMoviesResponse.fromJson(response.body);
    this.popularList = [...popularList,...popularMovies.results];
    notifyListeners();



    //if(response.statusCode != 200){print("Respuesta incorrecta codigo ${response.statusCode}");}
    //print(decodedData["results"][1]);
  }


}