import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/events/dragable_sheet_event_state.dart';

class DraggableBottomSheetBloc extends BaseBloc<DraggableBottomSheetState, DraggableBottomSheetEvent>{
  DraggableBottomSheetBloc() : super(DraggableBottomSheetEventInitial()){
    on((event, emit) => {
      if (event is DraggableBottomSheetEventInitial){

      }
    });
  }

}