import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  await _priorToStart();
  await _runApp();
}

Future _priorToStart() async{
  //nothing now
  return;
}

Future _runApp() async{
  runApp(const App());
}
