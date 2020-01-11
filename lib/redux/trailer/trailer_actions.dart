import 'package:meta/meta.dart';
import 'package:redux_testing/data/model/resultsitem_data.dart';
import 'package:redux_testing/data/model/trailer_data.dart';
import 'package:redux_testing/redux/action_report.dart';
import 'package:redux_testing/data/model/page_data.dart';

class GetTrailersAction {
  final String actionName = "GetTrailersAction";
  final bool isRefresh;

  GetTrailersAction({this.isRefresh});
}

class GetTrailerAction {
  final String actionName = "GetTrailerAction";
  final int id;

  GetTrailerAction({@required this.id});
}

class TrailerStatusAction {
  final String actionName = "TrailerStatusAction";
  final ActionReport report;

  TrailerStatusAction({@required this.report});
}

class SyncTrailersAction {
  final String actionName = "SyncTrailersAction";
  final Page page;
  final List<ResultsItem> trailers;

  SyncTrailersAction({this.page, this.trailers});
}

class SyncTrailerAction {
  final String actionName = "SyncTrailerAction";
  final ResultsItem trailer;

  SyncTrailerAction({@required this.trailer});
}

class CreateTrailerAction {
  final String actionName = "CreateTrailerAction";
  final Trailer trailer;

  CreateTrailerAction({@required this.trailer});
}

class UpdateTrailerAction {
  final String actionName = "UpdateTrailerAction";
  final Trailer trailer;

  UpdateTrailerAction({@required this.trailer});
}

class DeleteTrailerAction {
  final String actionName = "DeleteTrailerAction";
  final Trailer trailer;

  DeleteTrailerAction({@required this.trailer});
}

class RemoveTrailerAction {
  final String actionName = "RemoveTrailerAction";
  final int id;

  RemoveTrailerAction({@required this.id});
}

