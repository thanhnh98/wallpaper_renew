import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/base/app/base.dart';
import 'package:wallpaper/base/widget/base.dart';
import 'package:wallpaper/bloc/main_app_bloc.dart';
import 'package:wallpaper/screen/home/home_page.dart';

class App extends BaseApp {
  const App({key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends BaseState<App, MainAppBloc> with WidgetsBindingObserver{

  _AppState(): super();

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
          color: initialColor(),
          debugShowCheckedModeBanner: false,
          theme: initialTheme(),
          title: initialTitle(),
          home: HomePage(),
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

  Widget launchPage() {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: initialColor(),
    );
  }

  Color initialColor() {
    return const Color(0xFFFFFFFF);
  }

  ThemeData initialTheme() {
    return ThemeData(
      primaryColor: Colors.blue,
      fontFamily: 'Roboto',
      textSelectionColor: const Color(0xFFAFE1EF),
    );
  }


  String initialTitle() {
    return "rebuild wallpaper";
  }

}