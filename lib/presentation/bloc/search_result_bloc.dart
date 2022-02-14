import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/common/app_preferences.dart';
import 'package:wallpaper/di/get_it.dart';
import 'package:wallpaper/helper/image_cached_helper.dart';
import 'package:wallpaper/model/album.dart';
import 'package:wallpaper/model/photo.dart';
import 'package:wallpaper/network/repositories/photo_repository.dart';
import 'package:wallpaper/presentation/events/search_event_state.dart';
import 'package:wallpaper/presentation/events/search_result_state_event.dart';

class SearchResultBloc extends BaseBloc<SearchResultEvent, SearchResultState> {
  PhotoRepository? photoRepo = getPhotoRepo();
  AlbumModel? _albumDetail;
  SearchStateLoadCompleted? searchCompletedState;

  SearchResultBloc(this.searchCompletedState) : super(SearchResultStateLoading()){
    on((event, emit) => {
        if (event is SearchResultEventLoading){
            emit.call(SearchResultStateLoading())
        }
        else if (event is SearchResultEventLoaded){
          emit.call(SearchResultStateLoaded(event.albumModel))
        }
    });
    requestSearch();
    ImageCachedHelper.onCachingImagesChanged((photo) => {
      unlikePhoto(photo)
    });
  }


  void unlikePhoto(Photo newPhoto){
    _albumDetail?.photos?.forEach((photo) {
      if (newPhoto.id == photo.id){
        photo.liked = newPhoto.liked;
        add(SearchResultEventLoaded(_albumDetail));
        return;
      }
    });
  }

  Future<void> requestSearch() async{
    AlbumModel? result = await photoRepo?.searchPhotos(searchCompletedState?.keywordTranslated??"");
    if (result == null) {
      return;
    }
    result.photos?.forEach((photo) {
      AppPreferences.getImageLikedById(photo.id).then((value) => {
        photo.liked = value
      });
    });
    _albumDetail = result;
    add(SearchResultEventLoaded(_albumDetail));
  }

  void loadMore() async {
    if (_albumDetail?.next_page == null){
      add(SearchResultEventLoaded(_albumDetail));
      return;
    }

    AlbumModel? result = await photoRepo?.fetchAlbumWithUrl(_albumDetail?.next_page??"");

    if (result == null) {
      return;
    }

    result.photos?.forEach((photo) {
      AppPreferences.getImageLikedById(photo.id).then((value) => {
        photo.liked = value
      });
    });

    if (_albumDetail == null) {
      _albumDetail = result;
    } else {
      _albumDetail!
        ..photos!.addAll(result.photos??[])
        ..next_page = result.next_page
        ..page = result.page
        ..total_results = result.total_results
        ..url = result.url;
    }
    add(SearchResultEventLoaded(_albumDetail));
  }

  void likePhoto(Photo photo, bool isLiked){
    ImageCachedHelper.putImagesCached(photo, isLiked);
  }
}