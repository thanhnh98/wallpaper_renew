import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/events/home_event_state.dart';

class HomeBloc extends BaseBloc<HomeState, HomeEvent>{
  HomeBloc() : super(HomeEventInitial()){
    on(event, emit){
      if (event is HomeEventInitial){
         print(event.helloString);
      }
    }
  }
}