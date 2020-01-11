import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:redux_testing/data/model/nowplaying_data.dart';

class FavoriteState {
   Box<dynamic> favorites;
   MoviesModel favorite;

  FavoriteState({
    @required this.favorites,
    @required this.favorite,
  });

  FavoriteState copyWith({
    Box favorites,
  }) {
    return FavoriteState(
      favorites: favorites ?? this.favorites,
      favorite: favorite ?? this.favorite,
    );
  }
}