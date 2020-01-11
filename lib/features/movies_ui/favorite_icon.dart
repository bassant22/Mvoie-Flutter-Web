import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_testing/data/model/nowplaying_data.dart';
import 'package:redux_testing/features/favorite_movies/favorite_view_model.dart';
import 'package:redux_testing/redux/app/app_state.dart';

class FavoriteIcon extends StatelessWidget {
  MoviesModel movie ;
  FavoriteIcon(this.movie);

  @override
  Widget build(BuildContext context) {
    return StoreConnector< AppState, MovieFavoriteViewModel>(
      distinct: true,
      converter: (store) => MovieFavoriteViewModel.fromStore(store),
      builder: (_, viewModel) => FavoriteIconContent(
        viewModel,movie
      ),
    );
  }
}
class FavoriteIconContent extends StatefulWidget {

  final MovieFavoriteViewModel viewModel;
  MoviesModel movie;


  FavoriteIconContent(this.viewModel,this.movie);


  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIconContent> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite_border),
      onPressed: () {
          this.widget.viewModel.addFavorite(this.widget.movie);
       },
    );
  }
}
