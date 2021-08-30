import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app_v2/Providers/providers.dart';
import 'package:peliculas_app_v2/models/cast_response.dart';
import 'package:provider/provider.dart';


class CastingCards extends StatelessWidget {
  
  final int idMovie;
  CastingCards({required this.idMovie});

  @override
  Widget build(BuildContext context) {

    final CreditsProvider creditsProvider = Provider.of(context, listen: false);

    return FutureBuilder(
      future: creditsProvider.getCast(this.idMovie.toString()),
      builder: (_, AsyncSnapshot<List<CastResponse>> snapshot) {

        if(!snapshot.hasData){
          return Container(
            height: 190,
            child: CupertinoActivityIndicator());
        }
        final List<CastResponse> cast = snapshot.data!;

        return Container(
        margin: EdgeInsets.only(bottom: 30),
        width: double.infinity,
        height: 190,
        color: Colors.red,
        child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cast.length,
        itemBuilder: (BuildContext context, int index) {

          return _CastCard(actor: cast[index]);
        },
      ),
    );
      },
    );


    
  }
}

class _CastCard extends StatelessWidget {

  final CastResponse actor;

  _CastCard({required this.actor});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 110,
      height: 100,
      color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              image: NetworkImage(actor.getprofilePath),
              placeholder: AssetImage("assets/no-image.jpg"),
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 2,),
          Text(
            "${actor.name}",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
