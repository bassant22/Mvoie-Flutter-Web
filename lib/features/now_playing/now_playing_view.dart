import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_testing/data/model/nowplaying_data.dart';
import 'package:redux_testing/features/favorite_movies/favorite_view.dart';
import 'package:redux_testing/features/movies_ui/horizontal_ui.dart';
import 'package:redux_testing/features/movies_ui/vertical_ui.dart';
import 'package:redux_testing/features/now_playing/now_playing_view_model.dart';
import 'package:redux_testing/redux/app/app_state.dart';

class Now_PlayingView extends StatelessWidget {
Now_PlayingView();
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Now_PlayingViewModel>(
      distinct: true,
      converter: (store) => Now_PlayingViewModel.fromStore(store),
      builder: (_, viewModel) => Now_PlayingViewContent(
        viewModel: viewModel,
      ),
    );
  }
}

class Now_PlayingViewContent extends StatefulWidget {
  final Now_PlayingViewModel viewModel;
  Now_PlayingViewContent({Key key, this.viewModel})
      : super(key: key);

  @override
  _Now_PlayingViewContentState createState() => _Now_PlayingViewContentState();
}

class _Now_PlayingViewContentState extends State<Now_PlayingViewContent> {
  @override
  void initState() {
    super.initState();
    this.widget.viewModel.getNowPlayings(true, describeEnum(MovieTypes.now_playing));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      width: 150.0,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(50, 50),
                                bottomRight: Radius.elliptical(50, 50)),
                            shape: BoxShape.rectangle),
                        child: IconButton(
                          tooltip: 'Favorite Movies',
                          icon: Icon(
                            Icons.favorite,
                            size: 25.0,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FavoriteView()));
                          },
                        )),
                  ],
                )),
            Column(
              children: <Widget>[
                HorizontalUi(),
                VerticalUi(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
