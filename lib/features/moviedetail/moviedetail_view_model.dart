import 'package:redux/redux.dart';
import 'package:redux_testing/data/model/cast.dart';
import 'package:redux_testing/data/model/detail_data.dart';
import 'package:redux_testing/data/model/resultsitem_data.dart';
import 'package:redux_testing/data/model/trailer_data.dart';
import 'package:redux_testing/redux/action_report.dart';
import 'package:redux_testing/redux/app/app_state.dart';
import 'package:redux_testing/redux/detail/detail_actions.dart';
import 'package:redux_testing/redux/movieCast/movieCast_actions.dart';
import 'package:redux_testing/redux/movieCast/movieCast_state.dart';
import 'package:redux_testing/redux/trailer/trailer_actions.dart';

class MovieDetailViewModel {
  final Detail detail;
  final List<Detail> details;
  //final Cast cast;
  final List<Cast> casts;
  final List<ResultsItem> trailer;
  final Function(bool) getDetails;
  final Function getDetail;
  final Function getCast;
  final Function getTrailer;
  final ActionReport getDetailsReport;
  final ActionReport getDetailReport;
  final ActionReport getCastReport;
  final ActionReport getTrailerReport;

  MovieDetailViewModel({
    this.detail,
    this.details,
    this.casts,
    this.trailer,
    this.getDetails,
    this.getDetail,
    this.getCast,
    this.getTrailer,
    this.getDetailsReport,
    this.getCastReport,
    this.getDetailReport,
    this.getTrailerReport
  });

  static MovieDetailViewModel fromStore(Store<AppState> store) {
    return MovieDetailViewModel(
      detail: store.state.detailState.detail,
      details: store.state.detailState.details.values.toList() ?? [],
      casts: store.state.movieCastState.casts.values.toList() ?? [],
      trailer: store.state.trailerState.trailers.values.toList() ?? [],

      getDetails: (isRefresh) {
        store.dispatch(GetDetailsAction(isRefresh: isRefresh));
      },
      getDetail: (int id){
        store.dispatch(GetDetailAction(id: id));
      },
      getCast: (int id){
        store.dispatch(GetCastAction(id: id));
      },
      getTrailer: (int id){
        store.dispatch(GetTrailerAction(id: id));
      },
      getDetailsReport: store.state.detailState.status["GetDetailsAction"],
      getDetailReport: store.state.detailState.status["GetDetailAction"],
      getCastReport: store.state.movieCastState.status["GetCastAction"],
      getTrailerReport: store.state.trailerState.status["GetTrailerAction"]


    );
  }
}
