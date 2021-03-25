import 'package:dwm14/constants/firebase.dart';
import 'package:dwm14/models/movie.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({
    Key key,
  }) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  getMovie(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator()
              ),
              );
          default:
          if (!snapshot.hasData) {
            return Center(
              child: Text ('Pas de films'),
            );
          } 
          List movies = snapshot.data;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.0), 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                        arguments: ItemArguments(title: movies[index].title),
                        );
                      },
                      child: Container(
                        height: 450,
                        width: 400,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(movies[index].poster))),
                      ),
                    ),
                    Text(movies[index].title, style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(movies[index].year),
                    Text(movies[index].kind.toString()),
                  ]
                ),
              );
            },
          );
        }
      }
    );
  }
}