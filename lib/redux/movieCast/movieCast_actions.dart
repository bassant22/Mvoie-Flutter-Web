import 'package:meta/meta.dart';
import 'package:redux_testing/data/model/cast.dart';
import 'package:redux_testing/data/model/detail_data.dart';
import 'package:redux_testing/redux/action_report.dart';
import 'package:redux_testing/data/model/page_data.dart';
class GetCastAction {
  final String actionName = "GetCastAction";
  final int id;

  GetCastAction({@required this.id});

}

class CastStatusAction {
  final String actionName = "CastStatusAction";
  final ActionReport report;

  CastStatusAction({@required this.report});
}

class SyncCastsAction {
  final String actionName = "SyncCastAction";
  final List<Cast> cast;
  SyncCastsAction({@required this.cast});
}


class SyncCastAction {
  final String actionName = "SyncTrailerAction";
  final Cast cast;

  SyncCastAction({@required this.cast});
}