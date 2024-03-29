import 'dart:ffi';

import 'package:image_downloader/image_downloader.dart';
import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/common/manager/image_downloader.dart' as imd;
import 'package:wallpaper/common/manager/wallpaper_manager.dart';
import 'package:wallpaper/helper/image_cached_helper.dart';
import 'package:wallpaper/model/download_image.dart';
import 'package:wallpaper/model/photo.dart';
import 'package:wallpaper/presentation/events/photo_detail_event_state.dart';

class PhotoDetailBloc extends BaseBloc<PhotoDetailEvent, PhotoDetailState>{
  Photo photo;
  DownloadImageModel? _imageDownloaded;

  PhotoDetailBloc(this.photo) : super(PhotoDetailStateLoad()){
    on((event, emit) => {
        if(event is PhotoDetailEventDownloadImage){
          emit.call(PhotoDetailStateDownloadImage(event.photoId, event.downloadedPercent, event.photoDownloadedDetail))
        }
    });
    ImageDownloader.callback(onProgressUpdate: (imageId, progress) {
       add(PhotoDetailEventDownloadImage(
           photo.id,
           progress,
           null
       ));
    });
  }

  void putLikeImage(bool liked) {
    ImageCachedHelper.putImagesCached(photo, liked);
  }

  void downloadImage() async{

    if (photo.src == null || photo.src?.original.isEmpty == true)
      return;

    _imageDownloaded = await imd.downloadImage(photo.src!.original);

    add(PhotoDetailEventDownloadImage(
        photo.id,
        100,
        _imageDownloaded
    ));
  }

  void requestSetBackground() async {
    if (_imageDownloaded != null && _imageDownloaded?.path != null) {
      WallpaperManager.createWallpaperChooser(_imageDownloaded!);
    }
    else {
      _imageDownloaded = await imd.downloadImage(photo.src!.original);
      WallpaperManager.createWallpaperChooser(_imageDownloaded!);
    }
  }
}