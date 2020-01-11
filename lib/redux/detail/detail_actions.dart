import 'package:meta/meta.dart';
import 'package:redux_testing/data/model/detail_data.dart';
import 'package:redux_testing/redux/action_report.dart';
import 'package:redux_testing/data/model/page_data.dart';

class GetDetailsAction {
  final String actionName = "GetDetailsAction";
  final bool isRefresh;

  GetDetailsAction({this.isRefresh});
}

class GetDetailAction {
  final String actionName = "GetDetailAction";
  final int id;

  GetDetailAction({@required this.id});
}

class DetailStatusAction {
  final String actionName = "DetailStatusAction";
  final ActionReport report;

  DetailStatusAction({@required this.report});
}

class SyncDetailsAction {
  final String actionName = "SyncDetailsAction";
  final Page page;
  final List<Detail> details;

  SyncDetailsAction({this.page, this.details});
}

class SyncDetailAction {
  final String actionName = "SyncDetailAction";
  final Detail detail;

  SyncDetailAction({@required this.detail});
}

class CreateDetailAction {
  final String actionName = "CreateDetailAction";
  final Detail detail;

  CreateDetailAction({@required this.detail});
}

class UpdateDetailAction {
  final String actionName = "UpdateDetailAction";
  final Detail detail;

  UpdateDetailAction({@required this.detail});
}

class DeleteDetailAction {
  final String actionName = "DeleteDetailAction";
  final Detail detail;

  DeleteDetailAction({@required this.detail});
}

class RemoveDetailAction {
  final String actionName = "RemoveDetailAction";
  final int id;

  RemoveDetailAction({@required this.id});
}

