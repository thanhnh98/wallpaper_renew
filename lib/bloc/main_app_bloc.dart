import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/events/main_event_state.dart';

class MainAppBloc extends BaseBloc<MainAppEvent, MainAppState> {
  MainAppBloc() : super(MainAppState());
}