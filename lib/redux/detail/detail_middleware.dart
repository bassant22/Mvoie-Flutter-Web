import 'package:redux/redux.dart';
import 'package:redux_testing/data/remote/detail_repository.dart';
import 'package:redux_testing/redux/action_report.dart';
import 'package:redux_testing/redux/app/app_state.dart';
import 'package:redux_testing/redux/detail/detail_actions.dart';

List<Middleware<AppState>> createDetailMiddleware([
  DetailRepository _repository = const DetailRepository(),
]) {
  final getDetail = _createGetDetail(_repository);

  return [
    TypedMiddleware<AppState, GetDetailAction>(getDetail),
  ];
}

Middleware<AppState> _createGetDetail(DetailRepository repository) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) {
    if (checkActionRunning(store, action)) return;
    if (action.id == null) {
      idEmpty(next, action);
    } else {
      running(next, action);
        //print('.................................................... id is ${action.id}');
      repository.getDetail(action.id).then((item) {
        //print('.................................................... Item is ${item.originalTitle}');

        next(SyncDetailAction(detail: item));
        completed(next, action);
      }).catchError((error) {
        catchError(next, action, error);
      });
    }
  };
}
bool checkActionRunning(Store<AppState> store, action) {
/*  if (store.state.photoState.status[action.actionName]?.status ==
      ActionStatus.running) {
    return true; // do nothing if there is a same action running.
  }*/
  return false;
}

void catchError(NextDispatcher next, action, error) {
  next(DetailStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "${action.actionName} is error;${error.toString()}")));
}

void completed(NextDispatcher next, action) {
  next(DetailStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "${action.actionName} is completed")));
}

void noMoreItem(NextDispatcher next, action) {
  next(DetailStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "no more items")));
}

void running(NextDispatcher next, action) {
  next(DetailStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.running,
          msg: "${action.actionName} is running")));
}

void idEmpty(NextDispatcher next, action) {
  next(DetailStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "Id is empty")));
}