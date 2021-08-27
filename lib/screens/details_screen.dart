import 'package:flutter/material.dart';
import 'package:peliculas_app_v2/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //recibir argumentos

    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? "No-movie";

    return Scaffold(
      body: CustomScrollView(
        //los slivers son widgets que tienen un comportamiento preprogramado
        //cuando se hace scroll en el padre
        slivers: [
          _CustomAppBarr(),
          SliverList(delegate: SliverChildListDelegate([
            _PosterAddTitle(),
            _Overview(),
            CastingCards()
            ]))
        ],
      ),
    );
  }
}

class _CustomAppBarr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //abppbar al que puedo modificarle el ancho
    return SliverAppBar(
      backgroundColor: Colors.green[300],
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
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Movie title",
              style: TextStyle(
                fontSize: 18,
              ),
            )),
        background: FadeInImage(
          image: NetworkImage("https://via.placeholder.com/300x200"),
          placeholder: AssetImage("assets/loading.gif"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAddTitle extends StatelessWidget {
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
              image: NetworkImage("https://via.placeholder.com/200x300"),
              placeholder: AssetImage("assets/no-image.jpg"),
              height: 150,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Movie-title",
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
                Text(
                "Original-title",
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                child: Row(children: [
                  Icon(Icons.star_outline,size: 15,color: Colors.grey),
                  SizedBox(width: 5,),
                  Text("Movie-Vote", style: textTheme.caption,)
                ],),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text("In adipisicing excepteur et aliquip veniam ipsum dolore esse laboris anim. Id ullamco id laborum irure labore adipisicing cupidatat cillum elit nostrud officia dolore nostrud. Aute ex elit consequat pariatur voluptate tempor nulla consectetur amet. Do proident id ea anim dolor consequat cupidatat non.Aliqua elit aute esse duis reprehenderit cillum. Nostrud ipsum cillum pariatur tempor mollit veniam sunt quis duis do dolore culpa culpa officia. Labore veniam magna ea esse ipsum magna laboris commodo sunt elit aute reprehenderit. Ullamco voluptate sit cillum nostrud velit ut.Magna ex reprehenderit cupidatat aliqua labore consequat irure ipsum quis cupidatat nisi ex. Enim quis pariatur ex proident mollit mollit cillum quis elit anim cillum occaecat qui cupidatat. Commodo cupidatat excepteur tempor amet incididunt culpa cillum veniam adipisicing minim occaecat do proident. Excepteur Lorem occaecat Lorem dolore incididunt quis quis aliqua proident minim aliqua. Esse minim aliquip dolore mollit laborum Lorem quis qui elit nostrud id.", textAlign: TextAlign.justify, style: Theme.of(context).textTheme.subtitle1,)
    );
  }
}