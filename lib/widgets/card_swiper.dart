import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:peliculas_app_v2/models/models.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  CardSwiper({required this.movies});

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    //Esperar hasta que se cargue las peliculas para que no aparezca un error temporal
    //al iniciar

    if(movies.length ==0){
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      color: Colors.red,
      child: Swiper(
        itemCount: movies.length,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.5 * 0.9,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {

          final Movie movie = movies[index];

          return GestureDetector(
            onTap: (){
              //le paso como argumento la instancia de movie para tener
              //la información en la siguiente página
              Navigator.pushNamed(context, "details",arguments: movie);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage("assets/no-image.jpg"), 
                image: NetworkImage(movie.getPosterImg),
                fit: BoxFit.cover,),
                
            ),
          );
            },
      ),
    );
  }
}
