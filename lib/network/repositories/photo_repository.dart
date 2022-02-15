import 'package:wallpaper/model/album.dart';
import 'package:wallpaper/model/list_image_model.dart';
import 'package:wallpaper/network/api_client.dart';
import 'dart:convert';

class PhotoRepository extends ApiClient {
  Future<AlbumModel> fetchAlbumWithUrl(String url) async{
    final response = await super.get(url);
    if(response.statusCode == 200) {
      return AlbumModel.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("load api failed");
    }
  }

  Future<AlbumModel> searchPhotos(String keyword, {int perpage = 80}) async{
    final response = await super.get("/v1/search?query=$keyword&per_page=$perpage");
    if(response.statusCode == 200) {
      return AlbumModel.fromJson(json.decode(response.body));
    }
    else {
      throw Exception("load api failed");
    }
  }
}