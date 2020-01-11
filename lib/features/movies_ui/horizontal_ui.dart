import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:redux_testing/data/model/nowplaying_data.dart';
import 'package:redux_testing/features/moviedetail/moviedetail_view.dart';
import 'package:redux_testing/features/movies_ui/favorite_icon.dart';
import 'package:redux_testing/features/now_playing/now_playing_view_model.dart';
import 'package:redux_testing/redux/app/app_state.dart';

class HorizontalUi extends StatelessWidget {
  HorizontalUi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Now_PlayingViewModel>(
      distinct: true,
      converter: (store) => Now_PlayingViewModel.fromStore(store),
      builder: (_, viewModel) => HorizontalUiContent(
        viewModel: viewModel,
      ),
    );
  }
}

class HorizontalUiContent extends StatefulWidget {
  final Now_PlayingViewModel viewModel;


  HorizontalUiContent({Key key, this.viewModel}) : super(key: key);

  @override
  _HorizontalUiState createState() => _HorizontalUiState();
}

class _HorizontalUiState extends State<HorizontalUiContent> {
  @override
  void initState() {
    this.widget
    .viewModel.getNowPlayings(true, describeEnum(MovieTypes.now_playing));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,bottom: 10.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Now Playing',
                      style: GoogleFonts.caveat(
                        textStyle: TextStyle(fontSize: 26.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 10.0),
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: this.widget.viewModel.movies[describeEnum(MovieTypes.now_playing)]?.values?.toList()?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        MoviesModel movie = this.widget.viewModel.movies[describeEnum(MovieTypes.now_playing)].values.toList()[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MovieDetailView(movie.id)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  child: Image.network(movie.posterPath,width: 180.0,fit: BoxFit.fitWidth,),
                                ),
                                FavoriteIcon(movie),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
        } else
          return Container(
            color: Colors.red,
          );
      },
    );
  }
}
