import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:wallpaper/app_config.dart';
import 'package:wallpaper/di/get_it.dart';

import 'app.dart';

void main() async {
  await _priorToStart();
  await _runApp();
}

Future _priorToStart() async{
  buildDependencies(flavorName: "dev");
  return;
}

Future _runApp() async{
  AppConfig config = getAppConfigFlavor();
  runApp(App(config));
}
