import 'package:redux/redux.dart';
import 'package:redux_testing/data/model/nowplaying_data.dart';
import 'package:redux_testing/redux/action_report.dart';
import 'package:redux_testing/redux/app/app_state.dart';
import 'package:redux_testing/redux/nowplaying/nowplaying_actions.dart';

class Now_PlayingViewModel {
  final MoviesModel nowplaying;
  final Map<String, Map<String,MoviesModel>> movies;
  final Function(bool, String) getNowPlayings;
  final ActionReport getNowPlayingsReport;
  Now_PlayingViewModel({
    this.nowplaying,
    this.movies,
    this.getNowPlayings,
    this.getNowPlayingsReport,
  });

  static Now_PlayingViewModel fromStore(Store<AppState> store) {
  //print('ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp');
    return Now_PlayingViewModel(
      nowplaying: store.state.nowplayingState.nowplaying,
      movies: store.state.nowplayingState?.movies,
      getNowPlayings: (isRefresh, type) {
        store.dispatch(GetNowPlayingsAction(isRefresh: isRefresh,type: type));
      },
      getNowPlayingsReport: store.state.nowplayingState.status["GetNowPlayingsAction"],
    );
  }
}
