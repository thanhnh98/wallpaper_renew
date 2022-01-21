import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper/base/widget/base.dart';
import 'package:wallpaper/bloc/draggable_bottom_sheet_bloc.dart';
import 'package:wallpaper/common/color_utils.dart';
import 'package:wallpaper/common/constant.dart';
import 'package:wallpaper/common/navigator_custom.dart';
import 'package:wallpaper/common/sized_config.dart';
import 'package:wallpaper/common/style_utils.dart';
import 'package:wallpaper/events/dragable_sheet_event_state.dart';
import 'package:wallpaper/model/horizontal_landing_item.dart';
import 'package:wallpaper/model/photo.dart';

class DraggableBottomSheet extends BaseStatefulWidget{
  @override
  State<StatefulWidget> createState() => _DraggableBottomSheet();

}

class _DraggableBottomSheet extends BaseStateWidget<DraggableBottomSheet, DraggableBottomSheetBloc> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, scrollController){
          return Container(
                    height: SizeConfig.blockSizeVertical * 30,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: SizeConfig.verticalSize(5),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: BorderRadius.circular(15).topRight,
                        topLeft: BorderRadius.circular(15).topLeft,
                      ),
                      color: CommonColor.primaryColorLight,
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.horizontalSize(5),
                            top: SizeConfig.horizontalSize(5),
                            right: SizeConfig.horizontalSize(5)),
                        child:  BlocBuilder(
                          bloc: bloc,
                          buildWhen: (oldState, newState){
                            return newState is DraggableBottomSheetStateLoaded ||
                                    newState is DraggableBottomSheetStateInitial;
                          },
                          builder: (context, state){
                            print("state ${state}\n");
                            return GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                                controller: scrollController,
                                itemCount: 1,
                                itemBuilder: (context, index){
                                  return _buildListFavouriteEmpty();
                                });
                          },
                        )
                    )
          );
            // return StaggeredGrid.count(
            //   crossAxisCount: 2,
            //   controller: scrollController,
            //   itemCount: listImg.length + 1,
            //   itemBuilder: (context, index){
            //     if (index == 0) {
            //       return SizedBox(
            //         height: 32,
            //         child: Padding(
            //           padding: EdgeInsets.all(10),
            //           child: RichText(
            //             text: TextSpan(
            //               text: "S.current.favourite_list",
            //               style: CommonStyle.textStyleCustom(
            //                 size: 24.0,
            //                 weight: FontWeight.bold,
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     } else {
            //       return _buildHorizontalItem(listImg[index - 1]);
            //     }
            //   },
            // );
          });
  }

  @override
  DraggableBottomSheetBloc? initBloc() {
    return DraggableBottomSheetBloc();
  }


  Widget _buildListFavouriteEmpty() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: "S.current.favourite_list",
                  style: CommonStyle.textStyleCustom(
                    size: 20.0,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            )),
        GestureDetector(
          onTap: (){
            print("on tapped ${bloc}");
            bloc?.loadImage();
          },
          child: Center(
            child: Image.asset(
              "assets/empty_image.png",
              width: SizeConfig.horizontalSize(15),
              height: SizeConfig.horizontalSize(15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "S.current.favourite_photo_des",
              style: CommonStyle.textStyleCustom(
                size: 14.0,
                weight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalItem(Photo photo) {
    String imgPath =
    (photo.liked) ? "assets/heart_solid.svg" : "assets/heart_empty.svg";
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Align(
                child: ClipRRect(
                    borderRadius: new BorderRadius.all(Radius.circular(10)),
                    child: Center(
                        child: Hero(
                          tag: photo.id,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/img_loading.gif',
                            image: photo.src?.tiny ?? "",
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                            alignment: Alignment.center,
                          ),
                        ))),
              ),
              Align(
                child: GestureDetector(
                  onTap: () {
                    // photo.liked = !photo.liked;
                    // setState(() {
                    //   imgPath = photo.liked
                    //       ? "assets/heart_solid.svg"
                    //       : "assets/heart_empty.svg";
                    // });
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100]?.withOpacity(0.5)),
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: SvgPicture.asset(imgPath),
                    ),
                  ),
                ),
                alignment: Alignment.bottomRight,
              )
            ],
          )),
    );
  }

  Widget _buildItemSingle(HorizontalLandingItemModel item) {
    return GestureDetector(
      onTap: () {
        NavigatorGlobal.pushAlbumHomePage(context, item.url);
      },
      child: Container(
          width: SizeConfig.horizontalSize(50),
          height: SizeConfig.verticalSize(40),
          margin: EdgeInsets.only(right: 10),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage.assetNetwork(
                  placeholder: '',
                  image: item.assetsImageCover,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
              ),
              //   child: Container(
              //     width: double.infinity,
              //     height: double.infinity,
              //     color: Colors.blueGrey,
              //   ),
              // ),
              Align(
                alignment: Alignment(-1, 1),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6),
                      borderRadius: BorderRadius.only(
                          topRight: BorderRadius.circular(15).topRight,
                          bottomLeft: BorderRadius.circular(15).bottomLeft)),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: RichText(
                      text: TextSpan(
                          text: item.title,
                          style:
                          CommonStyle.textStyleCustom(color: Colors.white)),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}