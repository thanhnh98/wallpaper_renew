import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/model/album_cover.dart';
import 'package:wallpaper/model/photo.dart';
import 'package:wallpaper/presentation/screen/album_detail_page.dart';

class NavigatorGlobal{
  static void pushAlbumHomePage(BuildContext context, AlbumCoverModel albumCoverModel){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AlbumDetailPage(albumCoverModel)));
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