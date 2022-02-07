import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/presentation/events/view_full_photo_state_event.dart';

class ViewFullPhotoBloc extends BaseBloc<ViewFullPhotoEvent, ViewFullPhotoState>{
  ViewFullPhotoBloc() : super(ViewFullPhotoStateLoad());

}