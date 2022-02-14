import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpaper/base/widget/base.dart';
import 'package:wallpaper/common/color_utils.dart';
import 'package:wallpaper/common/style_utils.dart';
import 'package:wallpaper/model/photo.dart';
import 'package:wallpaper/presentation/bloc/view_full_photo_bloc.dart';

class ViewFullPhotoPage extends BaseStatefulWidget{
  Photo? photo;
  ViewFullPhotoPage(this.photo, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewFullPhotoState(this.photo);

}

class _ViewFullPhotoState extends BaseStateWidget<ViewFullPhotoPage, ViewFullPhotoBloc>{
  bool _isShowPreview = false;
  Photo? photo;
  _ViewFullPhotoState(this.photo);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: CommonColor.black_33,
          child: Lottie.asset("assets/finding_image.json"),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildImageView(),
              )
          ),
        ),
        IgnorePointer(
          child:AnimatedOpacity(
              opacity: _isShowPreview ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: _buildPreviewComponent()
                ),
              )
          ),
        )
      ],
    );
  }

  @override
  ViewFullPhotoBloc? initBloc() {
    return ViewFullPhotoBloc();
  }

  Widget _buildImageView() {
    return GestureDetector(
        onTap: (){
          setState(() {
            _isShowPreview = !_isShowPreview;
          });
        },
        child: InteractiveViewer(
          scaleEnabled: true,
          child: Hero(
            tag: photo?.id??"",
            child: FadeInImage.assetNetwork(
              placeholder: "assets/empty.png",
              image: photo?.src?.original??"",
              fit: BoxFit.fitHeight,
              height: double.infinity,
            ),
          ),
        )
    );
  }

  Widget _buildIconDownload() {
    return  _buildIcon(
      const Icon(
        Icons.arrow_downward_outlined,
        size: 50,
        color: Colors.white70,
      ),
    );
  }

  Widget _buildIconSetBackground(context) {
    return  _buildIcon(
        const Icon(
          Icons.photo,
          size: 50,
          color: Colors.white70,
        )
    );
  }

  Widget _buildIcon(Widget icon) {
    return Padding(padding: const EdgeInsets.all(4.0), child: Center(child: icon));
  }

  Widget _buildPreviewComponent() {
    if (Platform.isAndroid){
      return _buildPreviewIos();
    }
    else {
      return _buildPreviewIos();
    }
  }

  Widget _buildPreviewAndroid() {
    return Stack(

    );
  }

  Widget _buildPreviewIos() {
    return Stack(
      children: [
        Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              RichText(
                  text: TextSpan(
                    text: "12:00",
                    style: CommonStyle.textStyleCustom(
                      size: 78.0,
                      weight: FontWeight.w400
                    )
                  )
              ),
              RichText(
                  text: TextSpan(
                    text: "Thứ 7, 12 tháng 2",
                    style: CommonStyle.textStyleCustom(
                      size: 24.0,
                      weight: FontWeight.w400
                    )
                  )
              ),
            ],
          )
        ),
        Align(
          alignment: const Alignment(-0.75, 0.85),
          child: _buildIconIos(
            const Icon(Icons.airplanemode_on_rounded, color: Colors.white,)
          )
        ),
        Align(
          alignment: const Alignment(0.75, 0.85),
          child: _buildIconIos(
            const Icon(Icons.photo_camera, color: Colors.white,)
          )
        )
      ],
    );
  }

  Widget _buildIconIos(Widget icon){
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: CommonColor.gray_7b.withOpacity(0.8)
      ),
      child: icon,
    );
  }
}