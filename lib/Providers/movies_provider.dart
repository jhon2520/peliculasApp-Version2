
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app_v2/models/models.dart';


class MoviesProvider extends ChangeNotifier{

  String _apiKey    = "a27fc2203f51a1bb39546fb877cdac6a";
  String _baseUrl   = "api.themoviedb.org";
  String _language  = "es-ES";
  List<Movie> onDisplayMovies = [];


  MoviesProvider() {
    this.getNowPlayingMovies();
  }

  

  void getNowPlayingMovies([int page = 1]) async{
    final url = Uri.https(_baseUrl, "3/movie/now_playing", {
        "api_key" : _apiKey,
        "language": _language,
        "page"    : '$page'
    });
    //get respuesta
    final response = await http.get(url);
    final NowPlayingResponse nowPlayingResponse = NowPlayingResponse.fronJson(response.body);
    this.onDisplayMovies =nowPlayingResponse.results;
    notifyListeners();

    // print(nowPlayingResponse.results[0].title);
  }

}