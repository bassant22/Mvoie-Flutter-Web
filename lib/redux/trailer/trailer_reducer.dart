import 'package:redux/redux.dart';
import 'package:redux_testing/redux/trailer/trailer_actions.dart';
import 'package:redux_testing/redux/trailer/trailer_state.dart';

final trailerReducer = combineReducers<TrailerState>([
  TypedReducer<TrailerState, TrailerStatusAction>(_trailerStatus),
  TypedReducer<TrailerState, SyncTrailersAction>(_syncTrailers),
  TypedReducer<TrailerState, SyncTrailerAction>(_syncTrailer),
]);

TrailerState _trailerStatus(TrailerState state, TrailerStatusAction action) {
  var status = state.status ?? Map();
  status.update(action.report.actionName, (v) => action.report,
      ifAbsent: () => action.report);
  return state.copyWith(status: status);
}

TrailerState _syncTrailers(TrailerState state, SyncTrailersAction action) {
  for (var trailer in action.trailers) {
    state.trailers.update(
        trailer.id.toString(), (v) => trailer, ifAbsent: () => trailer);
    return state.copyWith(trailers: state.trailers);
  }
}
TrailerState _syncTrailer(TrailerState state, SyncTrailerAction action) {
  state.trailers.update(action.trailer.id.toString(), (u) => action.trailer,
      ifAbsent: () => action.trailer);
  return state.copyWith(trailers: state.trailers, trailer: action.trailer);
}

