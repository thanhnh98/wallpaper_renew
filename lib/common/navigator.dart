import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/model/photo.dart';
import 'package:wallpaper/presentation/screen/photo_detail.dart';


class GlobalNavigator {
  static void pushAlbumHomePage(BuildContext context, String url) {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => AlbumHomePage(url)));
  }

  static void pushPhotoDetailPage(BuildContext context, Photo photo) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PhotoDetailPage(photo)));
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }

  static void backWithResult(BuildContext context, {var result}) {
    Navigator.pop(context, result);
  }

}