import 'package:flutter/material.dart';

import 'common/color_utils.dart';

class AppConfig {
  final String appName;
  final Color color;
  final String flavor;
  final Map<String, dynamic> variants;

  AppConfig(
      this.appName,
      this.flavor,
      {
        this.color = Colors.red,
        this.variants = const {}
      }){
  }
}
