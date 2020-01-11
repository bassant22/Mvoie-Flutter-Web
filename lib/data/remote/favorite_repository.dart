/*import 'package:hive/hive.dart';
import 'package:redux_testing/data/model/nowplaying_data.dart';

class FavoriteRepository{
  const FavoriteRepository();

  void addFavoriteMovie(MoviesModel moviesModel){
    final favoriteBox= Hive.box('favorite');
    favoriteBox.add(moviesModel);
  }

  Box<dynamic> getFavoritesMovie(){
    final favoriteBox=Hive.box('favorite');
    return favoriteBox;
  }

  void deleteFavoriteMovie(int index){
    final favoriteBox =Hive.box('favorite');
    favoriteBox.deleteAt(index);
  }
}*/