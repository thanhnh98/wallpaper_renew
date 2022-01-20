import 'package:flutter/cupertino.dart';

class CommonColor{
  static Color primaryColor = Color(0xff283593);
  static Color primaryColorLight = Color(0xff5f5fc4);
  static Color primaryColorDark = Color(0xff001064);
  static Color primaryColorAccent = Color(0xff3490dc);
  static Color black_33 = Color(0xff333333);
  static Color white = Color(0xffffffff);
  static Color backgroundGradientBegin = Color(0xff283593);
  static Color backgroundGradientMiddle = Color(0xff5f5fc4);
  static Color backgroundGradientEnd = Color(0xffffffff);
  static Color gray_f6 = Color(0xfff6f6f6);
  static Color gray_eb = Color(0xffebebeb);

  static Color alphaBlend(Color foreground, Color background) {
    final int alpha = foreground.alpha;
    if (alpha == 0x00) { // Foreground completely transparent.
      return background;
    }
    final int invAlpha = 0xff - alpha;
    int backAlpha = background.alpha;
    if (backAlpha == 0xff) { // Opaque background case
      return Color.fromARGB(
        0xff,
        (alpha * foreground.red + invAlpha * background.red) ~/ 0xff,
        (alpha * foreground.green + invAlpha * background.green) ~/ 0xff,
        (alpha * foreground.blue + invAlpha * background.blue) ~/ 0xff,
      );
    } else { // General case
      backAlpha = (backAlpha * invAlpha) ~/ 0xff;
      final int outAlpha = alpha + backAlpha;
      assert(outAlpha != 0x00);
      return Color.fromARGB(
        outAlpha,
        (foreground.red * alpha + background.red * backAlpha) ~/ outAlpha,
        (foreground.green * alpha + background.green * backAlpha) ~/ outAlpha,
        (foreground.blue * alpha + background.blue * backAlpha) ~/ outAlpha,
      );
    }
  }
}