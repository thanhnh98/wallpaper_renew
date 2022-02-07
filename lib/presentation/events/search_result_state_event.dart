import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/model/album.dart';

class SearchResultState extends BaseState {
  AlbumModel? albumModel;
  SearchResultState({this.albumModel});
}

class SearchResultStateLoading extends SearchResultState {}
class SearchResultStateLoaded extends SearchResultState {
    AlbumModel? albumModel;
    SearchResultStateLoaded(this.albumModel): super(albumModel: albumModel);
}


class SearchResultEvent extends BaseEvent {}
class SearchResultEventLoading extends SearchResultEvent {}
class SearchResultEventLoaded extends SearchResultEvent {
  AlbumModel? albumModel;
  SearchResultEventLoaded(this.albumModel);
}