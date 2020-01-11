import 'package:redux_testing/redux/favorite_movie/favorite_reducer.dart';
import 'package:redux_testing/redux/trailer/trailer_reducer.dart';
import 'package:redux_testing/redux/detail/detail_reducer.dart';
import 'package:redux_testing/redux/nowplaying/nowplaying_reducer.dart';
//import 'package:redux_testing/redux/movie/movie_reducer.dart';
import 'package:redux_testing/redux/app/app_state.dart';
import 'package:redux_testing/redux/movieCast/movieCast_reducer.dart';

///register all the Reducer here
///auto add new reducer when using haystack plugin
AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    trailerState: trailerReducer(state.trailerState, action),
    detailState: detailReducer(state.detailState, action),
    nowplayingState: nowplayingReducer(state.nowplayingState, action),
    //movieState: movieReducer(state.movieState, action),
    movieCastState: movieCastReducer(state.movieCastState,action),
    favoriteState: favoriteReducer(state.favoriteState,action),

  );
}
