import 'package:redux/redux.dart';
import 'package:redux_testing/redux/favorite_movie/favorite_action.dart';

import 'favorite_state.dart';

final favoriteReducer = combineReducers<FavoriteState>([
  TypedReducer<FavoriteState,SyncAllFavoriteAction>(_syncFavorites),
]);
FavoriteState _syncFavorites(FavoriteState state, SyncAllFavoriteAction action) {
  state.favorites = action.favorites;
  return state.copyWith(favorites: state.favorites);
}

