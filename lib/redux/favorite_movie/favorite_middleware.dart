// import 'package:hive/hive.dart';
// import 'package:redux/redux.dart';
// import 'package:redux_testing/data/model/nowplaying_data.dart';
// //import 'package:redux_testing/data/remote/favorite_repository.dart';
// import 'package:redux_testing/redux/action_report.dart';
// import 'package:redux_testing/redux/app/app_state.dart';
// import 'package:redux_testing/redux/detail/detail_actions.dart';
// import 'package:redux_testing/redux/favorite_movie/favorite_action.dart';
// import 'favorite_action.dart';

// List<Middleware<AppState>> createFavoriteMiddleware([
//  // FavoriteRepository _repository = const FavoriteRepository(),
// ]) {
//   final getAllFavorite = _createGetAllFavorite(_repository);
//   final addFavorite =_createCreateMovie(_repository);

//   return [
//     TypedMiddleware<AppState, GetAllFavoriteAction>(getAllFavorite),
//     TypedMiddleware<AppState, AddFavoriteAction>(addFavorite),
//   ];
// }
// Middleware<AppState> _createCreateMovie(FavoriteRepository repository) {
//   return (Store<AppState> store, dynamic action, NextDispatcher next) {

//     running(next, action);
//     repository.addFavoriteMovie((action as AddFavoriteAction).favorite);
//     next(SyncFavoriteAction(movie: action));
//       completed(next, action);
//   };
// }
// Middleware<AppState> _createGetAllFavorite(FavoriteRepository repository) {
//   return (Store<AppState> store, dynamic action, NextDispatcher next) {
//     running(next, action);
//        Box item =repository.getFavoritesMovie();
//        if (item.isNotEmpty) {
//         next(SyncAllFavoriteAction(favorites:item));
//       }
//       completed(next, action);
//   };
// }

// bool checkActionRunning(Store<AppState> store, action) {
//   return false;
// }

// void catchError(NextDispatcher next, action, error) {
//   next(DetailStatusAction(
//       report: ActionReport(
//           actionName: action.actionName,
//           status: ActionStatus.error,
//           msg: "${action.actionName} is error;${error.toString()}")));
// }

// void completed(NextDispatcher next, action) {
//   next(DetailStatusAction(
//       report: ActionReport(
//           actionName: action.actionName,
//           status: ActionStatus.complete,
//           msg: "${action.actionName} is completed")));
// }

// void noMoreItem(NextDispatcher next, action) {
//   next(DetailStatusAction(
//       report: ActionReport(
//           actionName: action.actionName,
//           status: ActionStatus.complete,
//           msg: "no more items")));
// }

// void running(NextDispatcher next, action) {
//   next(DetailStatusAction(
//       report: ActionReport(
//           actionName: action.actionName,
//           status: ActionStatus.running,
//           msg: "${action.actionName} is running")));
// }

// void idEmpty(NextDispatcher next, action) {
//   next(DetailStatusAction(
//       report: ActionReport(
//           actionName: action.actionName,
//           status: ActionStatus.error,
//           msg: "Id is empty")));
// }