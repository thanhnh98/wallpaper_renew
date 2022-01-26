import 'package:flutter/material.dart';
import 'package:wallpaper/di/get_it.dart';

import 'app.dart';

void main() async {
  await _priorToStart();
  await _runApp();
}

Future _priorToStart() async{
  buildDependencies();
  return;
}

Future _runApp() async{
  runApp(const App());
}
