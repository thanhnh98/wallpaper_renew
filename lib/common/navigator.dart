import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/model/album_cover.dart';
import 'package:wallpaper/model/photo.dart';
import 'package:wallpaper/presentation/screen/album_detail_page.dart';
import 'package:wallpaper/presentation/screen/photo_detail.dart';
import 'package:wallpaper/presentation/screen/search_page.dart';
import 'package:wallpaper/presentation/screen/search_result_page.dart';
import 'package:wallpaper/presentation/screen/view_full_photo_page.dart';


class GlobalNavigator {
  static void pushAlbumHomePage(BuildContext context, AlbumCoverModel item) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AlbumDetailPage(item)));
  }

  static void pushPhotoDetailPage(BuildContext context, Photo photo) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PhotoDetailPage(photo)));
  }

  static void pushViewFullPhotoPage(BuildContext context, Photo photo) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ViewFullPhotoPage(photo)));
  }

  static void pushSearchPage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SearchPage()));
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }

  static void backWithResult(BuildContext context, {var result}) {
    Navigator.pop(context, result);
  }

}