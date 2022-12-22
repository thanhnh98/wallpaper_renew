import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:wallpaper/app_config.dart';
import 'package:wallpaper/base/app/base.dart';
import 'package:wallpaper/base/widget/base.dart';
import 'package:wallpaper/app_bloc.dart';
import 'package:wallpaper/common/color_utils.dart';
import 'package:wallpaper/generated/l10n.dart';
import 'package:wallpaper/presentation/screen/home_page.dart';



class App extends BaseApp {
  AppConfig appConfig;
  App(this.appConfig, {key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState(appConfig);
}

class _AppState extends BaseStateWidget<App, MainAppBloc> with WidgetsBindingObserver{
  AppConfig appConfig;

  _AppState(this.appConfig): super();

  @override
  MainAppBloc? initBloc() {
    return MainAppBloc();
  }


  @override
  bool isInitialState(state) {
    return true;
  }

  @override
  bool isLoadedState(state) {
    return true;
  }

  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    Widget body = WillPopScope(
        onWillPop: () async => false, // disable pop
        child: MaterialApp(
          color: appConfig.color,
          debugShowCheckedModeBanner: true,
          theme: initialTheme(),
          title: appConfig.appName,
          home: HomePage(),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          navigatorObservers: [
            routeObserver
          ],
        ));

    return BlocBuilder(
      bloc: bloc,
      buildWhen: (previous, state) {
        return true;
      },
      builder: (ctx, state) {
        return body;
      },
    );
  }

  ThemeData initialTheme() {
    return ThemeData(
      primaryColor: CommonColor.primaryColor,
      fontFamily: 'Roboto',
    );
  }
}