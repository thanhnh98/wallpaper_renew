import 'package:rxdart/rxdart.dart';
import 'package:wallpaper/common/app_preferences.dart';
import 'package:wallpaper/model/photo.dart';

class ImageCachedHelper{
  static final PublishSubject _onCachingImagesChanged = PublishSubject<Photo>();

  static void onCachingImagesChanged(Function(Photo photo) onChanged){
    _onCachingImagesChanged.stream.listen((event) {
        if (event is Photo){
          onChanged(event);
        }
    });
  }

  static void putImagesCached(Photo photo, bool isLiked){
    photo.liked = isLiked;
    AppPreferences.putLikeImageById(photo, isLiked);
    _onCachingImagesChanged.add(photo);
  }
}