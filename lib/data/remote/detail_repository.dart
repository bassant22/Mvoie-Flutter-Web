import 'dart:async';
import 'package:redux_testing/data/model/detail_data.dart';
import 'package:redux_testing/data/network_common.dart';

class DetailRepository {
  const DetailRepository();

  Future<Map> getDetailsList(String sorting, int page, int limit) {
    return new NetworkCommon().dio.get("detail/", queryParameters: {
      "sorting": sorting,
      "page": page,
      "limit": limit
    }).then((d) {
      var results = new NetworkCommon().decodeResp(d);

      return results;
    });
  }

  Future<Detail> createDetail(Detail detail) {
    var dio = new NetworkCommon().dio;
    dio.options.headers.putIfAbsent("Accept", () {
      return "application/json";
    });
    return dio.post("detail/", data: detail).then((d) {
      var results = new NetworkCommon().decodeResp(d);

      return new Detail.fromJson(results);
    });
  }

  Future<Detail> updateDetail(Detail detail) {
    var dio = new NetworkCommon().dio;
    dio.options.headers.putIfAbsent("Accept", () {
      return "application/json";
    });
    return dio.put("detail/", data: detail).then((d) {
      var results = new NetworkCommon().decodeResp(d);

      return new Detail.fromJson(results);
    });
  }

  Future<int> deleteDetail(int id) {
    return new NetworkCommon().dio.delete("detail/", queryParameters: {"id": id}).then((d) {
      var results = new NetworkCommon().decodeResp(d);

      return 0;
    });
  }

  Future<Detail> getDetail(int id) {
    return new NetworkCommon().dio.get("movie/${id}?api_key=f55fbda0cb73b855629e676e54ab6d8e&language=en-US#", queryParameters: {"id": id}).then((d) {
      var results = new NetworkCommon().decodeResp(d);
      //print('.............................. the Return OF Repo$results');

      return new Detail.fromJson(results);
    });
  }
  
  Future<Map> getCast(int id){
    return new NetworkCommon().dio.get("movie/$id/credits?api_key=f55fbda0cb73b855629e676e54ab6d8e",queryParameters: {"id" : id}).then((d) {
      var results= new NetworkCommon().decodeResp(d) as Map;
     // print('.............................. the Return OF CAST ${results}');
     // print('.............................. the Return OF CAST22 ');

      return results;
    });
    
  }

  Future<Map> getTrailer(int id) {
    return new NetworkCommon().dio.get("movie/$id/videos?api_key=f55fbda0cb73b855629e676e54ab6d8e", queryParameters: {"id": id}).then((d) {
      var results = new NetworkCommon().decodeResp(d);

       print('.............................. the Return OF VIDeo ${results}');


      return results;
    });
  }

}
