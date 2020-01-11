import 'package:meta/meta.dart';
import 'package:redux_testing/data/model/nowplaying_data.dart';
import 'package:redux_testing/data/model/page_data.dart';
import 'package:redux_testing/redux/action_report.dart';

class NowPlayingState {
  final Map<String, Map<String,MoviesModel>> movies;
  final MoviesModel nowplaying;
  final Map<String, ActionReport> status;
  final Page page;

  NowPlayingState({
    @required this.movies,
    @required this.nowplaying,
    @required this.status,
    @required this.page,
  });

  NowPlayingState copyWith({
    Map<String, Map<String,MoviesModel>> movies,
    MoviesModel nowplaying,
    Map<String, ActionReport> status,
    Page page,
  }) {
    return NowPlayingState(
      movies: movies ?? this.movies ?? Map(),
      nowplaying: nowplaying ?? this.nowplaying,
      status: status ?? this.status,
      page: page ?? this.page,
    );
  }

}
