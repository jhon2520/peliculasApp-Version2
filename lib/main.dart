import 'package:flutter/material.dart';
import 'package:peliculas_app_v2/Providers/popular_provider.dart';
import 'package:provider/provider.dart';
import 'Screens/screens.dart';
import 'package:peliculas_app_v2/Providers/movies_provider.dart';

void main(){
  runApp(AppState());
}


class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        //por defecto, la opcion lazy en true hace que no se ejecute el constructor
        //de la clase moviesprovider hasta que haya una instancia, en este caso si quiero
        //que se ejecute el constructor de una entonces pongo lazy:false
        ChangeNotifierProvider(create: (_)=> MoviesProvider(), lazy: false,),
        ChangeNotifierProvider(create: (_)=> PopularProvider(), lazy: false,)
      ],
      child: MyApp(),
      );
  }
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movies App",
      initialRoute: "home",
      routes: {
        "home": (context)=> HomeScreen(),
        "details": (context)=> DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.indigo
        )
      ),
    );
  }
} 
