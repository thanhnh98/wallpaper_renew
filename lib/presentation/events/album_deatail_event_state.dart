import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/model/album.dart';
import 'package:wallpaper/model/list_image_model.dart';


//EVENT
class AlbumDetailEvent extends BaseEvent{}

class AlbumDetailEventLoad extends BaseEvent{
  bool isLoadingMore = false;
  String? url;
  AlbumDetailEventLoad({required this.isLoadingMore, this.url});
}

class AlbumDetailEventLoadingCompleted extends AlbumDetailEvent {
    AlbumModel? album_detail;
    AlbumDetailEventLoadingCompleted({this.album_detail});
}


//STATE
class AlbumDetailState extends BaseState {}
class AlbumDetailStateLoad extends AlbumDetailState {
  bool isLoadingMore = false;
  String? url;
  AlbumDetailStateLoad({required this.isLoadingMore, this.url});
}
class AlbumDetailStateLoadingCompleted extends AlbumDetailState {
  AlbumModel? album_detail;
  AlbumDetailStateLoadingCompleted({this.album_detail});
}