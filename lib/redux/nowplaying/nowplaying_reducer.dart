import 'package:redux/redux.dart';
import 'package:redux_testing/redux/nowplaying/nowplaying_actions.dart';
import 'package:redux_testing/redux/nowplaying/nowplaying_state.dart';

final nowplayingReducer = combineReducers<NowPlayingState>([
  TypedReducer<NowPlayingState, NowPlayingStatusAction>(_nowplayingStatus),
  TypedReducer<NowPlayingState, SyncNowPlayingsAction>(_syncNowPlayings),
  //TypedReducer<NowPlayingState, SyncNowPlayingAction>(_syncNowPlaying),
]);

NowPlayingState _nowplayingStatus(NowPlayingState state, NowPlayingStatusAction action) {
  var status = state.status ?? Map();
  status.update(action.report.actionName, (v) => action.report,
      ifAbsent: () => action.report);
  return state.copyWith(status: status);
}

NowPlayingState _syncNowPlayings(NowPlayingState state, SyncNowPlayingsAction action) {

 state.movies.putIfAbsent(action.type, ()=>Map());
  for (var nowplaying in action.nowplayings) {
    state.movies[action.type].update(nowplaying.id.toString(), (v) => nowplaying,
        ifAbsent: () => nowplaying);
  }
  state.page.currPage = action.page.currPage;
  state.page.pageSize = action.page.pageSize;
  state.page.totalCount = action.page.totalCount;
  state.page.totalPage = action.page.totalPage;
  return state.copyWith(movies: state.movies);
}
