import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/events/main_event_state.dart';

class MainAppBloc extends BaseBloc<MainAppState, MainAppEvent> {
  MainAppBloc() : super(MainAppEventInitial());
}