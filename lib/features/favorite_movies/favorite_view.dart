import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:redux_testing/data/model/nowplaying_data.dart';
import 'package:redux_testing/redux/app/app_state.dart';
import 'favorite_view_model.dart';

class FavoriteView extends StatelessWidget {
  MoviesModel movie;
  FavoriteView([this.movie]);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MovieFavoriteViewModel>(
      distinct: true,
      converter: (store) => MovieFavoriteViewModel.fromStore(store),
      builder: (_, viewModel) => FavoriteMovieUi(
         viewModel,movie
      ),
    );
  }
}

class FavoriteMovieUi extends StatefulWidget {
  final MovieFavoriteViewModel viewModel;
  MoviesModel favoriteMovie;
  FavoriteMovieUi(this.viewModel,this.favoriteMovie);
  @override
  _FavoriteMovieUiState createState() => _FavoriteMovieUiState();
}

class _FavoriteMovieUiState extends State<FavoriteMovieUi> {
  @override
  void initState() {

    super.initState();
    this.widget.viewModel.getFavorite(true);
  }
  @override
  Widget build(BuildContext context) {
    bool flag = false;

    var favoriteMovies = this.widget.viewModel.favoritesMovie;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _customBar(),
          SizedBox(
            height: 80.0,
          ),
          SizedBox(
            height: 360.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: favoriteMovies?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final newFav = favoriteMovies.getAt(index) as MoviesModel;
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                    child: Container(
                        width: 160,

                        child: Column(
                          children: <Widget>[
                            Container( height: 270,child: Image.network(newFav.posterPath)),
                            SizedBox(height: 8,),
                            Text(newFav.originalTitle),
                            flag
                                ? IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                              ),
                              onPressed: (){
                                setState(() {
                                  flag = true;
                                });
                              },
                              iconSize: 30.0,
                            )
                                : IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              onPressed:(){
                                setState(() {
                                  flag = false;
                                });
                                favoriteMovies.deleteAt(index);
                              },
                              iconSize: 30,
                            ),
                          ],
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }

  _customBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(50, 50),
                    bottomRight: Radius.elliptical(50, 50)),
                shape: BoxShape.rectangle),
            padding: EdgeInsets.only(left: 15.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 25.0,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        Container(
          padding: EdgeInsets.only(right: 80.0),
          child: Text(
            "Your Favorite Movies",
            style: GoogleFonts.caveat(
              textStyle: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
          ),
        ),
      ],
    );
  }
}
