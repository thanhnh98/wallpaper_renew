import 'package:flutter/cupertino.dart';

class CommonStyle{

  static const double small_text_size = 14.0;
  static const double normal_text_size = 16.0;
    static const double large_text_size = 20.0;
  static const double larger_text_size = 24.0;
  static const double extra_text_size = 28.0;
  static const double super_extra_text_size = 32.0;

  static const TextStyle normalTextStyle = TextStyle(
    fontFamily: 'SourceSans Pro',
    fontSize: normal_text_size,
    fontWeight: FontWeight.normal,
    height: 1.15,
    color: Color(0xFFFFFFFF),
  );

  static const TextStyle smallTextStyle = TextStyle(
    fontFamily: 'SourceSans Pro',
    fontSize: normal_text_size,
    fontWeight: FontWeight.normal,
    height: 1.15,
    color: Color(0xFFFFFFFF),
  );

  static const TextStyle normalTextStyleBold = TextStyle(
    fontFamily: 'SourceSans Pro',
    fontSize: normal_text_size,
    fontWeight: FontWeight.bold,
    height: 1.15,
    color: Color(0xFFFFFFFF),
  );

  static TextStyle textStyleCustom({
    dynamic size = normal_text_size,
    dynamic weight = FontWeight.bold,
    dynamic height = 1.15,
    dynamic color = const Color(0xFFFFFFFF),
    dynamic fontStyle = FontStyle.normal
  }) {
    return TextStyle(
      fontFamily: 'SourceSans Pro',
      fontSize: size,
      fontWeight: weight,
      height: height,
      color: color,
      fontStyle: fontStyle
    );
  }

  static const TextStyle titleTextStyle = TextStyle(
    fontFamily: 'SourceSans Pro',
    fontSize: large_text_size,
    fontWeight: FontWeight.bold,
    height: 1.15,
    color: Color(0xFFFFFFFF),
  );

  static const TextStyle titleTextStyleBlack = TextStyle(
    fontFamily: 'SourceSans Pro',
    fontSize: large_text_size,
    fontWeight: FontWeight.bold,
    height: 1.15,
    color: Color(0xFF333333),
  );

}