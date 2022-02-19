import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/common/app_preferences.dart';
import 'package:wallpaper/helper/image_cached_helper.dart';
import 'package:wallpaper/model/list_image_model.dart';
import 'package:wallpaper/model/photo.dart';
import 'package:wallpaper/widgets/draggable_bottom_sheet/dragable_sheet_event_state.dart';

class DraggableBottomSheetBloc extends BaseBloc<DraggableBottomSheetEvent, DraggableBottomSheetState>{
  DraggableBottomSheetBloc() : super(DraggableBottomSheetStateLoading()){
    on((event, emit) => {
      if (event is DraggableBottomSheetEventLoading){
          emit.call(DraggableBottomSheetStateLoading())
      }
      else if (event is DraggableBottomSheetEventLoaded){
          emit.call(DraggableBottomSheetStateLoaded(listImageModel: event.listImageModel))
      }
    });
    loadImage();
    ImageCachedHelper.onCachingImagesChanged((photo) => {
      print("on changed home bloc: ${photo.id}  ${photo.liked}"),
      loadImage()
    });
  }

  void loadImage() async {
    ListImageModel? listImages = await AppPreferences.getLikedImages();
    add(DraggableBottomSheetEventLoaded(listImageModel: listImages));
  }

  void likePhoto(Photo photo, bool isLiked){
    ImageCachedHelper.putImagesCached(photo, isLiked);
  }
}