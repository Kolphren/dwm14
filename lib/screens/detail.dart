import 'package:dwm14/components/drawer.dart';
import 'package:dwm14/constants/firebase.dart';
import 'package:dwm14/models/movie.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final ItemArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold (
      appBar: AppBar(
        centerTitle: true,
        title: Text('Détails du film'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: getOne(args.title),
          builder: (context, snapshot) {
            List info = snapshot.data;

            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(info[0].poster))),
                    ),
                    Text('Titre : '+ info[0].title),
                    SizedBox(height: 10),
                    Text('Année de sortie : '+ info[0].year),
                    SizedBox(height: 10),
                    Text('Durée (en minutes) : ' + info[0].runtime),
                    SizedBox(height: 10),
                    Text('Genres : '+ info[0].kind.toString()),
                    SizedBox(height: 10),
                    Text('Acteurs : ' + info[0].actors.toString(), textAlign: TextAlign.center,),
                    SizedBox(height: 10),
                    Text('Synopsis : ' + info[0].plot, textAlign: TextAlign.center,),
                    SizedBox(height: 10),
                    Container(
                      child:Row(
                        children: [
                          for (var i = 0; i < info[0].ratings.length; i++) 
                          Padding(
                            padding: const EdgeInsets.all(23.23),
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(info[0].ratings[i]['logo']))),
                                ),
                              Text(info[0].ratings[i]['source']),
                              Text('Note : ' + info[0].ratings[i]['value']),
                              ],
                            ),
                          ),
                        ],
                      )
                    ),
                  ]
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}