import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.infinity,
    height: 240,
    color: Colors.blue,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text("Populares",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 2,),

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
    color: Colors.green,
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, "details", arguments: "movie-instance" );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
              placeholder: AssetImage("assets/no-image.jpg"), 
              image: NetworkImage("https://via.placeholder.com/300x400"),
              height: 170,
              fit: BoxFit.cover,),
          ),
        ),

          Text("El regreso del último jday cabezó y pendejo care nalga",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,)
      ],
    ),
            );
  }
}