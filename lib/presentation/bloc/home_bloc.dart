import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/helper/image_cached_helper.dart';
import 'package:wallpaper/presentation/events/home_event_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState>{
  HomeBloc() : super(HomeStateInitial()){
    on(event, emit){
      if (event is HomeEventInitial){
         print(event.helloString);
      }
    }
  }
}