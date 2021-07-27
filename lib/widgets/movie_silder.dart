import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.infinity,
    height: 200,
    color: Colors.blue,
    child: Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text("Populares",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),

        // !! si dejo sólo el listview builder, como el toma de
        // !! referencia el alto de su padre, en este caso el column
        // !! y el column toma su alto la referencia de sus hijos entonces
        // !! hay conflicto, una solución es envolver el lvb con un expanded
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
            return _MoviePoster(); 
          },
          ),
        ),      
      ],
    ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 130,
    // height: 190,
    color: Colors.green,
    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            );
  }
}