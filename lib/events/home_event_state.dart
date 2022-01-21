import 'package:wallpaper/base/bloc/base.dart';

//EventState
class HomeEvent extends BaseEvent {}
class HomeEventInitial extends HomeEvent{
    String helloString = "hello there";
}

//ViewState
class HomeState extends BaseState {}
class HomeStateInitial extends HomeState {}