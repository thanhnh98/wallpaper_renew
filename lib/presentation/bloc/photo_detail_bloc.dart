import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/helper/image_cached_helper.dart';
import 'package:wallpaper/model/photo.dart';
import 'package:wallpaper/presentation/events/photo_detail_event_state.dart';

class PhotoDetailBloc extends BaseBloc<PhotoDetailEventLoad, PhotoDetailState>{
  PhotoDetailBloc() : super(PhotoDetailStateLoad()){
    on((event, emit) => {

    });
  }

  void putLikeImage(Photo photo, bool liked) {
    ImageCachedHelper.putImagesCached(photo, liked);
  }
}