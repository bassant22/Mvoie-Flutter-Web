import 'package:meta/meta.dart';
import 'package:redux_testing/data/model/cast.dart';
import 'package:redux_testing/redux/action_report.dart';

class MovieCastState {
  final Map<String, Cast> casts;
  final Cast cast;
  final Map<String, ActionReport> status;

  MovieCastState({
    @required this.casts,
    @required this.cast,
    @required this.status,
  });

  MovieCastState copyWith({
    Map<String, Cast> movies,
    Cast movie,
    Map<String, ActionReport> status,
  }) {
    return MovieCastState(
      casts: movies ?? this.casts ?? Map(),
      cast: movie ?? this.cast,
      status: status ?? this.status,
    );
  }
}
