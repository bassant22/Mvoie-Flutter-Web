import 'package:redux/redux.dart';
import 'package:redux_testing/data/model/resultsitem_data.dart';
import 'package:redux_testing/data/remote/detail_repository.dart';
import 'package:redux_testing/redux/action_report.dart';
import 'package:redux_testing/redux/app/app_state.dart';
import 'package:redux_testing/redux/trailer/trailer_actions.dart';
import 'package:redux_testing/data/model/trailer_data.dart';
import 'package:redux_testing/redux/trailer/trailer_actions.dart';
import 'package:redux_testing/data/model/page_data.dart';

List<Middleware<AppState>> createTrailerMiddleware([
  DetailRepository _repository = const DetailRepository(),
]) {
  final getTrailer = _createGetTrailer(_repository);

  return [
    TypedMiddleware<AppState, GetTrailerAction>(getTrailer),
  ];
}
Middleware<AppState> _createGetTrailer(
    DetailRepository repository) {
 // print('Trailer Movie Middle Ware -------------------------------');
  return (Store<AppState> store, dynamic action, NextDispatcher next) {
    if (checkActionRunning(store, action)) return;
    if (action.id == null) {
      idEmpty(next, action);
    } else {
      running(next, action);
      store.state.trailerState.trailers.clear();
      repository.getTrailer(action.id).then((map) {
        var l = map["results"] ?? List();
        List <ResultsItem> list = l.map<ResultsItem>((item) => new ResultsItem.fromJson(item)).toList();
        next(SyncTrailersAction(trailers: list));
        completed(next, action);
      }).catchError((error) {
        catchError(next, action, error);
      });
    }
  };
}
bool checkActionRunning(Store<AppState> store, action) {
  return false;
}

void catchError(NextDispatcher next, action, error) {
  next(TrailerStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "${action.actionName} is error;${error.toString()}")));
}

void completed(NextDispatcher next, action) {
  next(TrailerStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "${action.actionName} is completed")));
}

void noMoreItem(NextDispatcher next, action) {
  next(TrailerStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "no more items")));
}

void running(NextDispatcher next, action) {
  next(TrailerStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.running,
          msg: "${action.actionName} is running")));
}

void idEmpty(NextDispatcher next, action) {
  next(TrailerStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "Id is empty")));
}
