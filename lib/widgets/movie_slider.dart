
import 'package:flutter/material.dart';
import 'package:peliculas_app_v2/models/models.dart';

//como necesito tener control sobre el scroll del listview de peliculas polulares
// esta clase debe ser stafull y agregarle un contoller cuando se inicia el estado
//con el cual iré validando el scroll con un ScrollController el cual se escuchará en el 
//init state. Este ScrollController debe estar atado a un widget, en este caso, al 
//listviewbuilder. Para asegurar que el MovieSlider acepte cualquier tipo de información
//le paso por parámetro una función
class MovieSlider extends StatefulWidget {

  final List<Movie> populares;
  final String? titulo;
  final Function onNextPage;

  MovieSlider({required this.populares, required this.onNextPage,this.titulo});

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      // -500 para que no espere hasta el final del scroll
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 500){
        widget.onNextPage();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      color: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if(this.widget.titulo != null)
              Padding(
              padding: const EdgeInsets.all(8.0),
                child: Text(this.widget.titulo!,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),

        

          //ya que un listview toma el tamaño del padre y la columna en donde está toma el tamaño del
          //hijo para reenderizarse y ambos son flexibles a este cambio, se ocasiona un error
          //el cual puede ser solucionado con el expaded
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: widget.populares.length,
              itemBuilder: (BuildContext context, int index) {

                final Movie movie = widget.populares[index];     

                return _MoviePoster(movie: movie);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movie;

  _MoviePoster({required this.movie});

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
              Navigator.pushNamed(context, "details",arguments: this.movie);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage("assets/no-image.jpg"),
                image: NetworkImage(movie.getPosterImg.toString()),
                width: 130,
                height: 140,
                fit: BoxFit.cover),
            ),
          ),

            SizedBox(height: 5,),

            Text(movie.title.toString(), 
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center, maxLines: 2,)
        ],
      ),
    );
  }
}
