import 'package:redux_testing/data/model/resultsitem_data.dart';

class Trailer {
  int id;
  List<ResultsItem> results;

  Trailer({
    this.id = 0,
    this.results,
  });

  Trailer.fromJson(Map<String, dynamic>  map) :
        id = map['id']  ?? 0,
        results = map['results'];

  Trailer copyWith({
    int id,
    List<ResultsItem> results,
  }) {
    return Trailer(
      id: id ?? this.id,
      results: results ?? this.results,
    );
  }

}

