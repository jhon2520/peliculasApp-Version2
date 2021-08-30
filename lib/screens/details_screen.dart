import 'package:flutter/material.dart';
import 'package:peliculas_app_v2/models/models.dart';
import 'package:peliculas_app_v2/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    //recibir argumentos

    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    print(movie.title);

    return Scaffold(
      body: CustomScrollView(
        //los slivers son widgets que tienen un comportamiento preprogramado
        //cuando se hace scroll en el padre
        slivers: [
          _CustomAppBarr(movie: movie),
          SliverList(delegate: SliverChildListDelegate([
            _PosterAddTitle(movie: movie,),
            _Overview(movie: movie,),
            CastingCards(idMovie: movie.id!)
            ]))
        ],
      ),
    );
  }
}

class _CustomAppBarr extends StatelessWidget {

  final Movie movie;

  _CustomAppBarr({required this.movie});

  @override
  Widget build(BuildContext context) {
    //abppbar al que puedo modificarle el ancho
    return SliverAppBar(
      backgroundColor: Colors.blue[700],
      expandedHeight: 250,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Color.fromRGBO(0, 0, 0, 0.3),
            padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
            child: Text(
              '${movie.title}',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
              ),
            )),
        background: FadeInImage(
          image: NetworkImage('${movie.getBackDropPath}'),
          placeholder: AssetImage("assets/loading.gif"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAddTitle extends StatelessWidget {

  final Movie movie;

  _PosterAddTitle({required this.movie});


  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              image: NetworkImage('${movie.getPosterImg}'),
              placeholder: AssetImage("assets/no-image.jpg"),
              height: 150,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${movie.title}',
                  style: textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                  Text(
                  "${movie.originalTitle}",
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  child: Row(children: [
                    Icon(Icons.star_outline,size: 15,color: Colors.grey),
                    SizedBox(width: 5,),
                    Text('${movie.voteAverage}', style: textTheme.caption,)
                  ],),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final Movie movie;

  _Overview({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text('${movie.overview}', textAlign: TextAlign.justify, style: Theme.of(context).textTheme.subtitle1,)
    );
  }
}