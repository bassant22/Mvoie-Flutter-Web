import 'package:hive/hive.dart';
import 'package:redux/redux.dart';
import 'package:redux_testing/data/model/nowplaying_data.dart';
import 'package:redux_testing/redux/action_report.dart';
import 'package:redux_testing/redux/app/app_state.dart';
import 'package:redux_testing/redux/favorite_movie/favorite_action.dart';

class MovieFavoriteViewModel {
  final Box<dynamic> favoritesMovie;
  MoviesModel favorite;
  final ActionReport getFavoriteReport;
  final Function getFavorite;
  final Function addFavorite;

  MovieFavoriteViewModel({
    this.favoritesMovie,
    this.getFavoriteReport,
    this.getFavorite,
    this.addFavorite,
    this.favorite,
  });

  static MovieFavoriteViewModel fromStore(Store<AppState> store) {
    return MovieFavoriteViewModel(
        favoritesMovie: store.state.favoriteState.favorites,
        favorite:store.state.favoriteState.favorite,

        getFavorite: (bool isRefresh) {
          store.dispatch(GetAllFavoriteAction(isRefresh: isRefresh));
        },
        addFavorite: (MoviesModel favoriteMovie){
          store.dispatch(AddFavoriteAction(favorite: favoriteMovie));
        }
    );
  }
}
