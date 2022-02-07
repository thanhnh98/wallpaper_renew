import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper/base/widget/base.dart';
import 'package:wallpaper/common/navigator.dart';
import 'package:wallpaper/common/style_utils.dart';
import 'package:wallpaper/generated/l10n.dart';
import 'package:wallpaper/model/photo.dart';
import 'package:wallpaper/presentation/bloc/photo_detail_bloc.dart';

class PhotoDetailPage extends BaseStatefulWidget {
  Photo _photo;
  bool isThisPhotoDownloaded = false;

  PhotoDetailPage(this._photo, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhotoDetailState(_photo);
}

class _PhotoDetailState extends BaseStateWidget<PhotoDetailPage, PhotoDetailBloc> {
  Photo _photo;
  double itemSize = 40;
  _PhotoDetailState(this._photo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildImage(),
                SizedBox(
                  height: 5,
                ),
                _buildOptionsBar(),
                _buildBottomInfo()
              ],
            ),
          )
      ),
    );
  }

  Widget _buildImage() {
    return GestureDetector(
      onTap: () {
        _openFullScreen();
      },
      child: Hero(
        tag: _photo.id,
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/empty.png',
          image: _photo.src?.portrait??"",
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      )
    );
  }

  Widget _buildBottomInfo() {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.grey),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(S.current.info),
                  RichText(
                      text: TextSpan(
                          text: "(${_photo.width}x${_photo.height})",
                          style: CommonStyle.textStyleCustom(
                            size: 14.0,
                            weight: FontWeight.normal,
                            fontStyle: FontStyle.italic
                          )
                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _buildPhotographerInfo(),
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return RichText(
        text: TextSpan(text: title, style: CommonStyle.titleTextStyle));
  }

  Widget _buildOptionsBar() {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.grey),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle(S.current.options),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        _buildIconDownload(),
                        const SizedBox(
                          width: 15,
                        ),
                        _buildIconZoom(),
                        const SizedBox(width: 15,),
                        _buildIconSetBackground(),
                        const SizedBox(width: 15,),
                        _buildIconFavourite(),
                        const SizedBox(width: 15,),
                        _buildIconSharing()
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }

  Widget _buildIconDownload() {
    return _buildIcon(
      const Icon(
        Icons.arrow_downward_outlined,
        size: 24,
      ),
    );
    // return DownloadProgressProvider(
    //     data: _photo,
    //     child: ProcessingWidget(
    //       processingStream: _photoBloc.imageDownloadedPercent,
    //       child: GestureDetector(
    //           onTap: () {
    //             _photoBloc.downloadImage(_photo.src.original);
    //           },
    //           child: _buildIcon(
    //             Icon(
    //               Icons.arrow_downward_outlined,
    //               size: 24,
    //             ),
    //           )
    //       ),
    //     )
    // );
  }

  Widget _buildIconZoom() {
    return GestureDetector(
        onTap: () {
          _openFullScreen();
        },
        child: _buildIcon(const Icon(
          Icons.zoom_out_map,
          size: 24,
        )));
  }

  Widget _buildIconSetBackground(){
    return _buildIcon(
        Icon(
          Icons.photo,
          size: 24,
        )
    );
    // return GestureDetector(
    //   onTap: (){
    //     showDialog(
    //         context: context,
    //         builder: (contet){
    //           return WallpaperDialog(_photo);
    //         }
    //     );
    //   },
    //   child: _buildIcon(
    //     Icon(
    //       Icons.photo,
    //       size: 24,
    //     )
    //   ),
    // );
  }

  Widget _buildIconSharing(){
    return _buildIcon(
        Icon(
          Icons.share,
          size: 24,
        )
    );
    // return GestureDetector(
    //   onTap: (){
    //     showDialog(
    //         context: context,
    //         builder: (contet){
    //           return SharePhotoDialog(_photo);
    //         }
    //     );
    //   },
    //   child: _buildIcon(
    //       Icon(
    //         Icons.share,
    //         size: 24,
    //       )
    //   ),
    // );
  }

  Widget _buildIconFavourite(){
    String imgPath = _photo.liked
        ? "assets/heart_solid.svg"
        : "assets/heart_empty.svg";

    return GestureDetector(
      onTap: (){
        setState(() {
          _photo.liked = !_photo.liked;
          bloc?.putLikeImage(_photo, _photo.liked);
        });
      },
      child: _buildIcon(
        SvgPicture.asset(imgPath)
      ),
    );
  }

  Widget _buildIcon(Widget icon) {
    return Container(
        width: itemSize,
        height: itemSize,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(4)),
        child:
            Padding(padding: EdgeInsets.all(4.0), child: Center(child: icon)));
  }

  Widget _buildPhotographerInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(text: TextSpan(text: S.current.photo_by)),
            Flexible(
                child: RichText(
              text: TextSpan(
                  text: _photo.photographer,
                  style: CommonStyle.normalTextStyleBold),
            ))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            RichText(text: TextSpan(text: S.current.contact)),
            Flexible(
              child: GestureDetector(
                onTap: () {
                  // _photoBloc.openUrl(_photo.photographer_url);
                },
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  text: TextSpan(
                      text: _photo.photographer_url,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      )),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  void _openFullScreen() {
    GlobalNavigator.pushViewFullPhotoPage(context, _photo);
  }

  @override
  PhotoDetailBloc? initBloc() {
    return PhotoDetailBloc();
  }
}
