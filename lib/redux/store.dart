//import 'package:redux_remote_devtools/redux_remote_devtools.dart';
import 'package:redux_testing/redux/trailer/trailer_middleware.dart';
import 'package:redux_testing/redux/detail/detail_middleware.dart';
import 'package:redux_testing/redux/movieCast/movieCast_middleware.dart';
import 'package:redux_testing/redux/nowplaying/nowplaying_middleware.dart';
//import 'package:redux_testing/redux/movie/movie_middleware.dart';
//import 'package:logging/logging.dart';
import 'package:redux/redux.dart';
import 'package:redux_testing/redux/app/app_state.dart';
import 'package:redux_testing/redux/app/app_reducer.dart';
//import 'favorite_movie/favorite_middleware.dart';

Future<Store<AppState>> createStore() async {

//  var remoteDevtools = RemoteDevToolsMiddleware('192.168.1.12:8000');

//  var store =
  return Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: []
      ..addAll(createTrailerMiddleware())
      ..addAll(createDetailMiddleware())
      ..addAll(createCastMiddleware())
      ..addAll(createNowPlayingMiddleware())
      //..addAll(createMovieMiddleware())
    //  ..addAll(createFavoriteMiddleware())
//      ..addAll([remoteDevtools]),
//      ..addAll([
//        LoggingMiddleware<dynamic>.printer(level: Level.ALL),
//      ]),
  );

//  remoteDevtools.store = store;
//  await remoteDevtools.connect();
//
//
//  return store;
}
