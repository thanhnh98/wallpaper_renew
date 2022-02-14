import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper/common/color_utils.dart';
import 'package:wallpaper/common/style_utils.dart';
import 'package:wallpaper/model/language.dart';

class LanguageSwitcher extends StatefulWidget{
  Language defaultLanguage;
  LanguageSwitcherController? controller;

  LanguageSwitcher({Key? key, this.defaultLanguage =  Language.VI, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LanguageSwitcher(defaultLanguage, controller: controller);
}

class _LanguageSwitcher extends State<LanguageSwitcher>{
  Language languageSelected;
  LanguageSwitcherController? controller;

  _LanguageSwitcher(this.languageSelected, {this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildBody(),
      ],
    );
  }

  Widget _buildItem(Language language) {
    var flag = "";
    var text = "";
    Color backgroundColor;
    Color textColor;

    if (language == Language.VI){
      flag = "assets/flag_vi.svg";
      text = "VI";
    }
    if (language == Language.EN){
      flag = "assets/flag_en.svg";
      text = "EN";
    }

    if (language == languageSelected) {
      backgroundColor = CommonColor.white;
      textColor = CommonColor.black_33;
    }
    else {
      backgroundColor = CommonColor.gray_f6.withOpacity(0);
      textColor = CommonColor.gray_f6;
    }

    return GestureDetector(
      onTap: (){
        setState(() {
          if (this.languageSelected != language) {
            this.languageSelected = language;
            controller?.onLanguageSelected(this.languageSelected);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            children: [
              SvgPicture.asset(
                flag,
                width: 16,
                height: 16,
              ),
              SizedBox(
                width: 2,
              ),
              RichText(
                  text: TextSpan(
                      text: text,
                      style: CommonStyle.textStyleCustom(
                          weight: FontWeight.bold,
                          color: textColor,
                          size: 10.0
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            _buildItem(Language.VI),
            const SizedBox(
              width: 8,
            ),
            _buildItem(Language.EN)
          ],
        ),
      )
    );
  }
}

class LanguageSwitcherController {
  Language currentLanguage = Language.VI;

  LanguageSwitcherController({Language defaultLanguage = Language.VI}){
    currentLanguage = defaultLanguage;
  }

  void onLanguageSelected(Language language){
    currentLanguage = language;
  }
}