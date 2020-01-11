import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux_testing/data/model/nowplaying_data.dart';
import 'package:redux_testing/features/moviedetail/moviedetail_view.dart';
import 'package:redux_testing/features/now_playing/now_playing_view_model.dart';
import 'package:redux_testing/redux/app/app_state.dart';

import 'favorite_icon.dart';

class VerticalUi extends StatelessWidget {
  VerticalUi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Now_PlayingViewModel>(
      distinct: true,
      converter: (store) => Now_PlayingViewModel.fromStore(
          store),
      builder: (_, viewModel) => VerticalUiContent(
        viewModel: viewModel,
      ),
    );
  }
}

class VerticalUiContent extends StatefulWidget {
  final Now_PlayingViewModel viewModel;

  VerticalUiContent({Key key, this.viewModel}) : super(key: key);

  @override
  _VerticalUiContentState createState() => _VerticalUiContentState();
}

class _VerticalUiContentState extends State<VerticalUiContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    this.widget.viewModel.getNowPlayings(true, describeEnum(MovieTypes.popular));
    this.widget.viewModel.getNowPlayings(true, describeEnum(MovieTypes.top_rated));
    this.widget.viewModel.getNowPlayings(true, describeEnum(MovieTypes.upcoming));
    super.initState();
  }

  void showError(String error) {
    final snackBar = SnackBar(content: Text(error));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        height: 600,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(20.0),
              child: TabBar(
                indicator: BoxDecoration(color: Colors.black54),
                labelStyle: TextStyle(color: Colors.white),
                unselectedLabelColor: Colors.white30,
                tabs: <Widget>[
                  Tab(
                      child: Text(
                    'Popular',
                    style: GoogleFonts.caveat(
                      textStyle: TextStyle(fontSize: 22.0),
                    ),
                  )),
                  Tab(
                      child: Text(
                    'Top Rate',
                    style: GoogleFonts.caveat(
                      textStyle: TextStyle(fontSize: 22.0),
                    ),
                  )),
                  Tab(
                      child: Text(
                    'Up Coming',
                    style: GoogleFonts.caveat(
                      textStyle: TextStyle(fontSize: 22.0),
                    ),
                  )),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                children: [_ui(MovieTypes.popular), _ui(MovieTypes.top_rated), _ui(MovieTypes.upcoming)],
              ),
            ),
          ),
        ));
  }

  _ui(MovieTypes type) {
    return ListView(children: <Widget>[
      ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: this.widget.viewModel.movies[describeEnum(type)]?.values?.toList()?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            MoviesModel movie = this.widget.viewModel.movies[describeEnum(type)].values.toList()[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetailView(
                            movie.id)));
              },
              child: Container(
                decoration: new BoxDecoration(boxShadow: [
                  new BoxShadow(
                    color: Colors.black54,
                    blurRadius: 20.0,
                  ),
                ]),
                child: Card(
                  elevation: 1.0,
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 10.0,
                        ),
                        Stack(
                          children: <Widget>[
                            Image.network(
                              movie.posterPath,
                              fit: BoxFit.cover,
                              width: 120.0,
                              height: 130.0,
                            ),
                            FavoriteIcon(movie),
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              // height: double.infinity,
                              child: Text(
                                  movie.originalTitle,
                                  style: GoogleFonts.josefinSans(
                                    textStyle: TextStyle(
                                        fontSize: 18.0),
                                  )),
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                                'language :${movie.originalLanguage}',
                                style: GoogleFonts.josefinSans(
                                  textStyle: TextStyle(
                                      fontSize: 16.0),
                                )),
                            SizedBox(height: 5.0,),
                            Container(
                              // height: double.infinity,
                              child: Text(
                                  movie.releaseDate,
                                  style: GoogleFonts.josefinSans(
                                    textStyle: TextStyle(
                                        fontSize: 18.0),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    ]);
  }
}
