import 'package:meta/meta.dart';
import 'package:redux_testing/data/model/page_data.dart';
import 'package:redux_testing/redux/detail/detail_state.dart';
import 'package:redux_testing/redux/favorite_movie/favorite_state.dart';
//import 'package:redux_testing/redux/movie/movie_state.dart';
import 'package:redux_testing/redux/movieCast/movieCast_state.dart';
import 'package:redux_testing/redux/nowplaying/nowplaying_state.dart';
import 'package:redux_testing/redux/trailer/trailer_state.dart';

/// manage all state of this project
/// auto add new state when using haystack plugin
/// configure the initialize of state
class AppState {
  final TrailerState trailerState;
  final DetailState detailState;
  final MovieCastState movieCastState;
  final NowPlayingState nowplayingState;
  //final MovieState movieState;
  final FavoriteState favoriteState;

  AppState({
    @required this.trailerState,
    @required this.detailState,
    @required this.movieCastState,
    @required this.nowplayingState,
   // @required this.movieState,
    @required this.favoriteState,
  });

  factory AppState.initial() {
    return AppState(
      trailerState: TrailerState(
        trailer: null,
        trailers: Map(),
        status: Map(),
        page: Page(),
      ),
      detailState: DetailState(
        detail: null,
        details: Map(),
        status: Map(),
        page: Page(),
      ),
      nowplayingState: NowPlayingState(
        nowplaying: null,
        movies: Map(),
        status: Map(),
        page: Page(),
      ),
      /*movieState: MovieState(
        movie: null,
        movies: Map(),
        status: Map(),
        page: Page(),
      ),*/
      movieCastState: MovieCastState(
        status: Map(),
        cast: null,
        casts: Map(),
      ),
      favoriteState: FavoriteState(
        favorites: null,
        favorite: null,
      )
    );
  }
}
