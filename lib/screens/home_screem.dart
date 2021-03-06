import 'package:flutter/material.dart';
import 'package:peliculas_app_v2/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Peliculas en cine"),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){},
          icon: Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(),
            MovieSlider(),
          ],
        ),
      )
    );
  }
}
