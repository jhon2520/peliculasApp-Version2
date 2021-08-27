import 'package:flutter/material.dart';
import 'package:peliculas_app_v2/Providers/providers.dart';
import 'package:peliculas_app_v2/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //ve al arbol de widgets y traéme la instancia de moviesprovider
  final moviesProvider = Provider.of<MoviesProvider>(context);
  final popularProvider = Provider.of<PopularProvider>(context);

  print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Peliculas en Cines"),
        elevation: 10,
        actions: [
          IconButton(onPressed: (){},
          icon: Icon(Icons.search_outlined),)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
              //CardSwiper
                CardSwiper(movies:moviesProvider.onDisplayMovies),
      
              //listado Horizontal
              MovieSlider(populares: popularProvider.popularList)
          ]
        ),
      )
    );
  }
}
