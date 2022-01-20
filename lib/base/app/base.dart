

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/base/util/bloc.dart';
import 'package:wallpaper/base/widget/base.dart';
import 'package:wallpaper/screen/home/home_page.dart';

abstract class BaseApp extends BaseStatefulWidget {
  const BaseApp({key}) : super(key: key);
}

abstract class AppState<T extends BaseApp, B extends BaseBloc> extends BaseState<T, B>{

  AppState(): super();

}
