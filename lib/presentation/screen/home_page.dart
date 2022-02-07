import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/base/widget/base.dart';
import 'package:wallpaper/common/color_utils.dart';
import 'package:wallpaper/common/constant.dart';
import 'package:wallpaper/common/navigator.dart';
import 'package:wallpaper/common/sized_config.dart';
import 'package:wallpaper/common/style_utils.dart';
import 'package:wallpaper/generated/l10n.dart';
import 'package:wallpaper/model/album_cover.dart';
import 'package:wallpaper/presentation/bloc/home_bloc.dart';
import 'package:wallpaper/widgets/draggable_bottom_sheet.dart';
import 'package:wallpaper/widgets/vertical_left_bar.dart';

class HomePage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends BaseStateWidget<HomePage, HomeBloc> {
  _HomeState() : super();

  @override
  HomeBloc? initBloc() {
    return HomeBloc();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
              body: Stack(
                children: [
                  _buildBackground(),
                  _buildBody(),
                  _buildBottomSheet()
                ],
              ));
        });
  }

  Widget _buildSloganComponent() {
    return Container(
      margin: EdgeInsets.only(left: SizeConfig.horizontalSize(5)),
      child: RichText(
        text: TextSpan(
            text: S.current.app_slogan,
            style: CommonStyle.textStyleCustom(
                size: CommonStyle.normal_text_size,
                color: CommonColor.white,
                fontStyle: FontStyle.normal,
                weight: FontWeight.normal)),
      ),
    );
  }

  Widget _buildSearchComponent() {
    return GestureDetector(
      onTap: () {
        GlobalNavigator.pushSearchPage(context);
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 30,
          bottom: 15
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.7)),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Stack(
            children: [
              Align(
                alignment: Alignment(-1, 0),
                child: RichText(
                  text: TextSpan(
                      text: S.current.search,
                      style: CommonStyle.textStyleCustom(
                          size: 18.0, weight: FontWeight.normal)),
                ),
              ),
              const Align(
                  alignment: Alignment(1, 0),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 32,
                  ))
            ],
          ),
        ),
      ),
    );
  }



  List<Widget> _buildListImageCover() {
    List<Widget> listItem = [];

    listItem.add(VerticalLeftSideBar());
    listItem.add(const SizedBox(width: 20));

    for (AlbumCoverModel item in Constant.getListTopicLanding()) {
      listItem.add(_buildItemSingle(item));
    }

    return listItem;
  }


  Widget _buildItemSingle(AlbumCoverModel item) {
    return GestureDetector(
      onTap: () {
        GlobalNavigator.pushAlbumHomePage(context, item);
      },
      child: Container(
          width: SizeConfig.horizontalSize(50),
          height: SizeConfig.verticalSize(40),
          margin: const EdgeInsets.only(right: 10),
          child: Stack(
            children: [
              Hero(
                  tag: item.title,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/empty.png',
                      image: item.assetsImageCover,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                    ),
                  ),
              ),
              //   child: Container(
              //     width: double.infinity,
              //     height: double.infinity,
              //     color: Colors.blueGrey,
              //   ),
              // ),
              Align(
                alignment: const Alignment(-1, 1),
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

  Widget _buildBottomSheet() {
    return DraggableBottomSheet();
  }

 Widget _buildBackground() {
    return
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  CommonColor.primaryColorDark,
                  CommonColor.primaryColor
                ])),
      );
  }

  Widget _buildBody() {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                  tag: "search",
                  child: _buildSearchComponent()
              ),
              SizedBox(
                height: SizeConfig.verticalSize(2),
              ),
              _buildSloganComponent(),
              SizedBox(
                height: SizeConfig.verticalSize(1),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: SizeConfig.horizontalSize(5)),
                child: RichText(
                  text: TextSpan(
                      text: "1000+ ${S.current.photo}",
                      style: CommonStyle.textStyleCustom(
                        size: CommonStyle.super_extra_text_size,
                        color: CommonColor.white,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ),
              SizedBox(
                height: SizeConfig.verticalSize(4),
              ),
              Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildListImageCover(),
                    ),
                  )),
            ],
          ),
        ));
  }
}
