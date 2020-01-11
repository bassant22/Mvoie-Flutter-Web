import 'package:url_launcher/url_launcher.dart';

launchURL(urlId) async {
  String url = 'https://www.youtube.com/watch?v=$urlId';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
