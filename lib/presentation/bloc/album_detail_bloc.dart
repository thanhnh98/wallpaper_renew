import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/common/app_preferences.dart';
import 'package:wallpaper/di/get_it.dart';
import 'package:wallpaper/helper/image_cached_helper.dart';
import 'package:wallpaper/model/album.dart';
import 'package:wallpaper/model/album_cover.dart';
import 'package:wallpaper/model/photo.dart';
import 'package:wallpaper/network/repositories/photo_repository.dart';
import 'package:wallpaper/presentation/events/album_deatail_event_state.dart';

class AlbumDetailBloc extends BaseBloc<AlbumDetailEvent, AlbumDetailState> {
  PhotoRepository? photoRepo = getPhotoRepo();
  AlbumCoverModel albumCoverModel;
  AlbumModel? _albumDetail;

  AlbumDetailBloc(this.albumCoverModel) : super(AlbumDetailStateLoad(
      isLoadingMore: false,
      url: albumCoverModel.url
  )){
    on((event, emit) => {
        if(event is AlbumDetailEventLoad){
            emit.call(AlbumDetailStateLoad(isLoadingMore: event.isLoadingMore, url: event.url))
        },

        if(event is AlbumDetailEventLoadingCompleted){
            emit.call(AlbumDetailStateLoadingCompleted(album_detail: event.album_detail))
        },
    });
    loadListImagesByAlbumUrl(albumCoverModel.url);
    ImageCachedHelper.onCachingImagesChanged((photo) => {

    });
  }

  void unlikePhoto(Photo newPhoto){
    _albumDetail?.photos?.forEach((photo) {
        if (newPhoto.id == photo.id){
          photo.liked = newPhoto.liked;
          add(AlbumDetailEventLoadingCompleted(album_detail: _albumDetail));
          return;
        }
    });
  }

  void loadListImagesByAlbumUrl(String url) async {
    var albumDetail = await photoRepo?.fetchAlbumWithUrl(url);
    if (albumDetail == null)
      return;

    albumDetail.photos?.forEach((photo) {
      AppPreferences.getImageLikedById(photo.id).then((value) => {
        photo.liked = value
      });
    });

    if (_albumDetail == null) {
      _albumDetail = albumDetail;
    } else {
      _albumDetail!
          ..photos!.addAll(albumDetail.photos??[])
          ..next_page = albumDetail.next_page
          ..page = albumDetail.page
          ..total_results = albumDetail.total_results
          ..url = albumDetail.url;
    }
    add(AlbumDetailEventLoadingCompleted(album_detail: _albumDetail));
  }

  void loadMore(){
    loadListImagesByAlbumUrl(_albumDetail?.next_page??"");
  }

  void likePhoto(Photo photo, bool isLiked){
    //AppPreferences.putLikeImageById(photo, isLiked);
    ImageCachedHelper.putImagesCached(photo, isLiked);
  }
}