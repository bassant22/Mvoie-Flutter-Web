import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:redux_testing/data/model/nowplaying_data.dart';
import 'package:redux_testing/redux/action_report.dart';


class GetAllFavoriteAction {
  final String actionName = "GetAllFavoriteAction";
  final bool isRefresh;

  GetAllFavoriteAction({this.isRefresh});
}
class FavoriteStatusAction {
  final String actionName = "FavoriteStatusAction";
  final ActionReport report;

  FavoriteStatusAction({@required this.report});
}

class AddFavoriteAction {
  final String actionName = "AddFavoriteAction";
   MoviesModel favorite;

  AddFavoriteAction({this.favorite});
}

class SyncAllFavoriteAction {
  final String actionName = "SyncAllFavoriteAction";
  Box<dynamic> favorites;

  SyncAllFavoriteAction({this.favorites});
}

class RemoveFavoriteAction {
  final String actionName = "RemoveFavoriteAction";
  final int id;

  RemoveFavoriteAction({@required this.id});
}
class SyncFavoriteAction {
  final String actionName = "SyncFavoriteAction";
   MoviesModel movie;
  SyncFavoriteAction({@required this.movie});
}