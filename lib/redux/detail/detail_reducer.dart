import 'package:redux/redux.dart';
import 'package:redux_testing/redux/detail/detail_actions.dart';
import 'package:redux_testing/redux/detail/detail_state.dart';

final detailReducer = combineReducers<DetailState>([
  TypedReducer<DetailState, DetailStatusAction>(_detailStatus),
  TypedReducer<DetailState, SyncDetailsAction>(_syncDetails),
  TypedReducer<DetailState, SyncDetailAction>(_syncDetail),
  TypedReducer<DetailState, RemoveDetailAction>(_removeDetail),
]);

DetailState _detailStatus(DetailState state, DetailStatusAction action) {
  var status = state.status ?? Map();
  status.update(action.report.actionName, (v) => action.report,
      ifAbsent: () => action.report);
  return state.copyWith(status: status);
}

DetailState _syncDetails(DetailState state, SyncDetailsAction action) {
  for (var detail in action.details) {
    state.details.update(detail.id.toString(), (v) => detail, ifAbsent: () => detail);
  }
  state.page.currPage = action.page.currPage;
  state.page.pageSize = action.page.pageSize;
  state.page.totalCount = action.page.totalCount;
  state.page.totalPage = action.page.totalPage;
  return state.copyWith(details: state.details);
}

DetailState _syncDetail(DetailState state, SyncDetailAction action) {
  state.details.update(action.detail.id.toString(), (u) => action.detail,
      ifAbsent: () => action.detail);
  return state.copyWith(details: state.details, detail: action.detail);
}

DetailState _removeDetail(DetailState state, RemoveDetailAction action) {
  return state.copyWith(details: state.details..remove(action.id.toString()));
}
