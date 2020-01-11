import 'package:meta/meta.dart';
import 'package:redux_testing/data/model/resultsitem_data.dart';
import 'package:redux_testing/data/model/trailer_data.dart';
import 'package:redux_testing/data/model/page_data.dart';
import 'package:redux_testing/redux/action_report.dart';

class TrailerState {
  final Map<String, ResultsItem> trailers;
  final ResultsItem trailer;
  final Map<String, ActionReport> status;
  final Page page;

  TrailerState({
    @required this.trailers,
    @required this.trailer,
    @required this.status,
    @required this.page,
  });

  TrailerState copyWith({
    Map<String, ResultsItem> trailers,
    ResultsItem trailer,
    Map<String, ActionReport> status,
    Page page,
  }) {
    return TrailerState(
      trailers: trailers ?? this.trailers ?? Map(),
      trailer: trailer ?? this.trailer,
      status: status ?? this.status,
      page: page ?? this.page,
    );
  }
}
