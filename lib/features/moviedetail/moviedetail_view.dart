import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_testing/data/model/cast.dart';
import 'package:redux_testing/data/model/detail_data.dart';
import 'package:redux_testing/data/model/resultsitem_data.dart';
import 'package:redux_testing/features/moviedetail/moviedetail_view_model.dart';
import 'package:redux_testing/redux/app/app_state.dart';
import 'package:redux_testing/utils/lanch_utils.dart';

class MovieDetailView extends StatelessWidget {
  int movieId;

  // MovieDetailView({Key key,this.movie}) : super(key: key);
  MovieDetailView(this.movieId);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MovieDetailViewModel>(
      distinct: true,
      converter: (store) => MovieDetailViewModel.fromStore(store),
      builder: (_, viewModel) =>
          MovieDetailViewContent(viewModel: viewModel, movieId: movieId),
    );
  }
}

class MovieDetailViewContent extends StatefulWidget {
  final MovieDetailViewModel viewModel;
  int movieId;

  MovieDetailViewContent({Key key, this.viewModel, this.movieId})
      : super(key: key);

  @override
  _MovieDetailViewContentState createState() => _MovieDetailViewContentState();
}

class _MovieDetailViewContentState extends State<MovieDetailViewContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    this.widget.viewModel.getDetail(this.widget.movieId);
    this.widget.viewModel.getCast(this.widget.movieId);
    this.widget.viewModel.getTrailer(this.widget.movieId);
    //print('........................... the Return OF Detail${this.widget.viewModel.getDetail(419704)}');
  }

  @override
  void didUpdateWidget(MovieDetailViewContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    Future.delayed(Duration.zero, () {});
  }

  void showError(String error) {
    final snackBar = SnackBar(content: Text(error));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    Detail detail = this.widget.viewModel.detail;
    List<Cast> castList = this.widget.viewModel.casts;
    List<ResultsItem> trailer = this.widget.viewModel.trailer;

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Image.network(
                    'https://img.youtube.com/vi/${trailer[0].key}/hqdefault.jpg',
                    fit: BoxFit.cover,
                    height: 330.0,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.elliptical(50, 50),
                                bottomRight: Radius.elliptical(50, 50)),
                            shape: BoxShape.rectangle),
                        padding: EdgeInsets.only(right: 5.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 25.0,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                Container(
                    height: 280.0,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  detail.originalTitle,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      detail.voteAverage.toString(),
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    RatingBar(
                                      itemSize: 20.0,
                                      initialRating: 3,
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: AutoSizeText(
                                    detail.overview,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  height: 150.0,
                  width: 320.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Actors',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 50.0,
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: castList.length,
                            itemBuilder: (BuildContext context, int index) {
                              Cast cast = castList[index];
                              return Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      cast.profilePath,
                                    ),
                                    radius: 35.0,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 100.0,
              right: 20.0,
              child: CircleAvatar(
                child: IconButton(
                  icon: Icon(Icons.play_arrow),
                  iconSize: 30,
                  color: Colors.black,
                  onPressed: () => launchURL(trailer[0].key),
                ),
                backgroundColor: Colors.yellow,
                radius: 30.0,
              ),
            ),
          ],
        ));
  }
}
