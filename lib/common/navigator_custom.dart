import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/model/photo.dart';

class NavigatorGlobal{
  static void pushAlbumHomePage(BuildContext context, String url){
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => AlbumHomePage(url)));
  }

  static void pushPhotoDetailPage(BuildContext context, Photo photo){

  }

  static void pushSearchPage(BuildContext context){

  }

  static void pushVideoPage(BuildContext context){
    // Scaffold.of(context).showSnackBar(SnackBar(
    //   content: Text("Tính năng đang phát triển"),duration: Duration(milliseconds: 500),
    // ));

  }
}