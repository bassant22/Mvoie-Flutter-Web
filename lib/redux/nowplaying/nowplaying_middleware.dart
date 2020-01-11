import 'package:redux/redux.dart';
import 'package:redux_testing/redux/action_report.dart';
import 'package:redux_testing/redux/app/app_state.dart';
import 'package:redux_testing/redux/nowplaying/nowplaying_actions.dart';
import 'package:redux_testing/data/model/nowplaying_data.dart';
import 'package:redux_testing/data/remote/nowplaying_repository.dart';
import 'package:redux_testing/data/model/page_data.dart';

List<Middleware<AppState>> createNowPlayingMiddleware([
  NowPlayingRepository _repository = const NowPlayingRepository(),
]) {
  final getNowPlayings = _createGetNowPlayings(_repository);

  return [
    TypedMiddleware<AppState, GetNowPlayingsAction>(getNowPlayings),
  ];
}
Middleware<AppState> _createGetNowPlayings(
    NowPlayingRepository repository) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) {
    if (checkActionRunning(store, action)) return;
    running(next, action);
    if (action.isRefresh) {
      store.state.nowplayingState.page.currPage = 1;
      store.state.nowplayingState.movies.clear();
    } else {
      var p = ++store.state.nowplayingState.page.currPage;
      if (p > ++store.state.nowplayingState.page.totalPage) {
        noMoreItem(next, action);
        return;
      }
    }
    repository
        .getNowPlayingsList(
      store.state.nowplayingState.page.currPage,action.type)
        .then((map) {
      if (map.isNotEmpty) {
        var page = Page(
          totalPage: map["total_pages"],
          totalCount: map["total_results"],
          currPage: map["page"],
        );
        print('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM ${map}');

        var l = map["results"] ?? List();
        List<MoviesModel> list = l.map<MoviesModel>((item) => new MoviesModel.fromJson(item)).toList();
        print('ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp $list');
        next(SyncNowPlayingsAction(page: page, nowplayings: list,type: action.type));
      }
      completed(next, action);
    }).catchError((error) {
      catchError(next, action, error);
    });
  };
}

bool checkActionRunning(Store<AppState> store, action) {
  return false;
}

void catchError(NextDispatcher next, action, error) {
  next(NowPlayingStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "${action.actionName} is error;${error.toString()}")));
}

void completed(NextDispatcher next, action) {
  next(NowPlayingStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "${action.actionName} is completed")));
}

void noMoreItem(NextDispatcher next, action) {
  next(NowPlayingStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "no more items")));
}

void running(NextDispatcher next, action) {
  next(NowPlayingStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.running,
          msg: "${action.actionName} is running")));
}

void idEmpty(NextDispatcher next, action) {
  next(NowPlayingStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "Id is empty")));
}
