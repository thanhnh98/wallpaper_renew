import 'package:firebase_analytics/firebase_analytics.dart';

class AppAnalytics{
  static FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics.instance;

  static void logEventOpenAlbum(String albumTitle){
    _firebaseAnalytics.logEvent(name: "open_album", parameters: {
        "album_name": albumTitle
    });
  }
}