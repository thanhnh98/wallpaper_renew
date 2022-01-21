

import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/base/widget/base.dart';

abstract class BaseApp extends BaseStatefulWidget {
  const BaseApp({key}) : super(key: key);
}

abstract class AppState<T extends BaseApp, B extends BaseBloc> extends BaseStateWidget<T, B>{

  AppState(): super();

}
