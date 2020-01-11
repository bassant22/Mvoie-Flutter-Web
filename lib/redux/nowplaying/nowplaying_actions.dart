import 'package:meta/meta.dart';
import 'package:redux_testing/data/model/nowplaying_data.dart';
import 'package:redux_testing/redux/action_report.dart';
import 'package:redux_testing/data/model/page_data.dart';

class GetNowPlayingsAction {
  final String actionName = "GetNowPlayingsAction";
  final bool isRefresh;
  final String type;
  
  GetNowPlayingsAction({this.isRefresh,this.type});
}

class NowPlayingStatusAction {
  final String actionName = "NowPlayingStatusAction";
  final ActionReport report;
  NowPlayingStatusAction({@required this.report});
}

class SyncNowPlayingsAction {
  final String actionName = "SyncNowPlayingsAction";
  final Page page;
  final List<MoviesModel> nowplayings;
  final String type;

  SyncNowPlayingsAction({this.page, this.nowplayings,this.type});

  toJson() {
    return {
      "movies": this.nowplayings
    };
  }
}

class SyncNowPlayingAction {
  final String actionName = "SyncNowPlayingAction";
  final MoviesModel nowplaying;

  SyncNowPlayingAction({@required this.nowplaying});
}
