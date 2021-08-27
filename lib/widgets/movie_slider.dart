
import 'package:flutter/material.dart';
import 'package:peliculas_app_v2/models/models.dart';

class MovieSlider extends StatelessWidget {

  final List<Movie> populares;

  MovieSlider({required this.populares});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      color: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Populares",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),

          //ya que un listview toma el tamaño del padre y la columna en donde está toma el tamaño del
          //hijo para reenderizarse y ambos son flexibles a este cambio, se ocasiona un error
          //el cual puede ser solucionado con el expaded
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: populares.length,
              itemBuilder: (BuildContext context, int index) {

                final Movie movie = populares[index];     

                return _MoviePoster(postePathPopular: movie.getPosterImg, movieName: movie.originalTitle!, );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final String postePathPopular;
  final String movieName;

  _MoviePoster({required this.postePathPopular, required this.movieName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 120,
      color: Colors.green,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, "details",arguments: "movie-instance");
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage("assets/no-image.jpg"),
                image: NetworkImage(postePathPopular),
                width: 130,
                height: 140,
                fit: BoxFit.cover),
            ),
          ),

            SizedBox(height: 5,),

            Text(movieName, 
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
