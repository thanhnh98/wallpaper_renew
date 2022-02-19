import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  Function onPressed;
  AppBackButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed.call();
      },
      child: Container(
        child: Hero(
          tag: "back_button",
          child: Icon(
            platformBackIcon(),
            color: Colors.white,
            size: 24,
          ),
        )
      ),
    );
  }
  IconData platformBackIcon(){
    if (Platform.isAndroid){
      return Icons.arrow_back;
    }
    else {
      return Icons.arrow_back_ios;
    }
  }
}