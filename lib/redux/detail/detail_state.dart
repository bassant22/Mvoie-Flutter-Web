import 'package:meta/meta.dart';
import 'package:redux_testing/data/model/detail_data.dart';
import 'package:redux_testing/data/model/page_data.dart';
import 'package:redux_testing/redux/action_report.dart';

class DetailState {
  final Map<String, Detail> details;
  final Detail detail;
  final Map<String, ActionReport> status;
  final Page page;

  DetailState({
    @required this.details,
    @required this.detail,
    @required this.status,
    @required this.page,
  });

  DetailState copyWith({
    Map<String, Detail> details,
    Detail detail,
    Map<String, ActionReport> status,
    Page page,
  }) {
    return DetailState(
      details: details ?? this.details ?? Map(),
      detail: detail ?? this.detail,
      status: status ?? this.status,
      page: page ?? this.page,
    );
  }
}
