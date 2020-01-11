import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteMovieHive extends StatefulWidget {
  @override
  _FavoriteMovieHiveState createState() => _FavoriteMovieHiveState();
}

class _FavoriteMovieHiveState extends State<FavoriteMovieHive> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('favorite'),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.done)
          {
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
              else
              return Container(color: Colors.red,);
          }
        else
          return Container(color: Colors.yellow,);
      },
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
