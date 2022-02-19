import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/model/list_image_model.dart';

class DraggableBottomSheetEvent extends BaseEvent{}
class DraggableBottomSheetEventLoading extends DraggableBottomSheetEvent{}
class DraggableBottomSheetEventLoaded extends DraggableBottomSheetEvent{
  ListImageModel? listImageModel;
  DraggableBottomSheetEventLoaded({this.listImageModel});
}

class DraggableBottomSheetState extends BaseState{}
class DraggableBottomSheetStateLoading extends DraggableBottomSheetState{}
class DraggableBottomSheetStateLoaded extends DraggableBottomSheetState{
  ListImageModel? listImageModel;
  DraggableBottomSheetStateLoaded({required this.listImageModel});
}