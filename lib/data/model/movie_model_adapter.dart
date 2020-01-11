part of 'nowplaying_data.dart';

class FavioriteAdapter extends TypeAdapter<MoviesModel> {
  @override
  MoviesModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{};
    for (int i = 0; i < numOfFields; i++)
      fields[reader.readByte()] = reader.read();

    return MoviesModel.fav(
      fields[0] as String,
      fields[1] as String,
    );
  }
  @override
  void write(BinaryWriter writer, MoviesModel obj) {
    print('.......................... Write Name ${obj.originalTitle}');
    print('............................... Write Age ${obj.posterPath}');
     writer
       ..writeByte(2)
       ..writeByte(0)
       ..write(obj.originalTitle)
       ..writeByte(1)
       ..write(obj._posterPath);
  }
}