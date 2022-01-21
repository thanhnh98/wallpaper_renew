import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/events/dragable_sheet_event_state.dart';

class DraggableBottomSheetBloc extends BaseBloc<DraggableBottomSheetEvent, DraggableBottomSheetState>{
  DraggableBottomSheetBloc() : super(DraggableBottomSheetStateInitial()){
    on((event, emit) => {
      if (event is DraggableBottomSheetEventLoaded){
          emit.call(DraggableBottomSheetStateLoaded())
      }
    });
  }

  void loadImage() {
      print("clicked");
      add(DraggableBottomSheetEventLoaded());
  }
}