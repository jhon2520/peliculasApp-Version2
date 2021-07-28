import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  //Forma de traer los argumentos pasados desde el pushname que me trajo aquí
  final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? "No-Movie";
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("$movie"),
        ),
      ),
    );
  }
}