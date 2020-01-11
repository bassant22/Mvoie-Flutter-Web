import 'package:redux_testing/redux/movieCast/movieCast_actions.dart';
import 'package:redux_testing/redux/movieCast/movieCast_state.dart';
import 'package:redux/redux.dart';


final movieCastReducer = combineReducers<MovieCastState>([
  TypedReducer<MovieCastState, CastStatusAction>(_movieCastStatus),
  TypedReducer<MovieCastState, SyncCastsAction>(_syncCasts),
  TypedReducer<MovieCastState, SyncCastAction>(_syncCast),
]);


MovieCastState _movieCastStatus(MovieCastState state, CastStatusAction action) {
  print('[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ reducer in Cast');
  var status = state.status ?? Map();
  status.update(action.report.actionName, (v) => action.report,
      ifAbsent: () => action.report);
  return state.copyWith(status: status);
}

MovieCastState _syncCasts(MovieCastState state, SyncCastsAction action) {
  print('[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ reducer in Cast');

  for (var cast in action.cast) {
    state.casts.update(cast.id.toString(), (v) => cast, ifAbsent: () => cast);
  }
  return state.copyWith(movies: state.casts);
}
MovieCastState _syncCast(MovieCastState state, SyncCastAction action) {
  state.casts.update(action.cast.id.toString(), (u) => action.cast,
      ifAbsent: () => action.cast);
  return state.copyWith(movies: state.casts, movie: action.cast);
}
