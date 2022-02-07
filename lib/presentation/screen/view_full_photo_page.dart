import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpaper/base/widget/base.dart';
import 'package:wallpaper/common/color_utils.dart';
import 'package:wallpaper/model/photo.dart';
import 'package:wallpaper/presentation/bloc/view_full_photo_bloc.dart';

class ViewFullPhotoPage extends BaseStatefulWidget{
  Photo? photo;
  ViewFullPhotoPage(this.photo, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewFullPhotoState(this.photo);

}

class _ViewFullPhotoState extends BaseStateWidget<ViewFullPhotoPage, ViewFullPhotoBloc>{
  bool _isImageTaped = false;
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
        Align(
          child: GestureDetector(
              child: AnimatedOpacity(
                  opacity: _isImageTaped ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.black38.withOpacity(0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Center(
                            child: _buildIconDownload(),
                          )),
                          Expanded(child: Center(
                            child: _buildIconSetBackground(context),
                          ))
                        ],
                      ),
                    ),
                  )
              )
          ),
          alignment: Alignment.bottomCenter,
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
            this._isImageTaped = !this._isImageTaped;
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
}