import 'package:wallpaper/base/bloc/base.dart';

//EventState
class HomeEvent extends BaseEventState {}
class HomeEventInitial extends HomeEvent{
    String helloString = "hello there";
}

//ViewState
class HomeState extends BaseViewState {}
class HomeStateInitial extends HomeState {}