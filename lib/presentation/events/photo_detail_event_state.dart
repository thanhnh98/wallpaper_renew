import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/model/download_image.dart';

class PhotoDetailState extends BaseState{}
class PhotoDetailStateLoad extends PhotoDetailState{}
class PhotoDetailStateDownloadImage extends PhotoDetailState{
  PhotoDetailStateDownloadImage(this.photoId, this.downloadedPercent, this.photoDownloadedDetail);
  int? photoId;
  int? downloadedPercent;
  DownloadImageModel? photoDownloadedDetail;
}

class PhotoDetailEvent extends BaseEvent {}
class PhotoDetailEventLoad extends PhotoDetailEvent {}
class PhotoDetailEventDownloadImage extends PhotoDetailEvent{
  PhotoDetailEventDownloadImage(this.photoId, this.downloadedPercent, this.photoDownloadedDetail);
  int? photoId;
  int? downloadedPercent;
  DownloadImageModel? photoDownloadedDetail;
}