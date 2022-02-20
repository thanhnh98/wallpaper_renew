import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/app_config.dart';
import 'package:wallpaper/di/get_it.dart';

import 'app.dart';

void main() async {
  await _priorToStart();
  await _runApp();
}

Future _priorToStart() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  buildDependencies(flavorName: "dev");

  return;
}

Future _runApp() async{
  AppConfig config = getAppConfigFlavor();
  runApp(App(config));
}
