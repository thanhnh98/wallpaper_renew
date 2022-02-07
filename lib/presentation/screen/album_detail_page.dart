import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpaper/base/widget/base.dart';
import 'package:wallpaper/common/color_utils.dart';
import 'package:wallpaper/common/navigator.dart';
import 'package:wallpaper/common/sized_config.dart';
import 'package:wallpaper/common/style_utils.dart';
import 'package:wallpaper/generated/l10n.dart';
import 'package:wallpaper/model/album.dart';
import 'package:wallpaper/model/album_cover.dart';
import 'package:wallpaper/model/photo.dart';
import 'package:wallpaper/presentation/bloc/album_detail_bloc.dart';
import 'package:wallpaper/presentation/events/album_deatail_event_state.dart';

class AlbumDetailPage extends BaseStatefulWidget {
  AlbumCoverModel albumCoverModel;
  AlbumDetailPage(this.albumCoverModel, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlbumDetailPage(this.albumCoverModel);
}

class _AlbumDetailPage extends BaseStateCollectionWidget<AlbumDetailPage, AlbumDetailBloc> with TickerProviderStateMixin {
  AlbumCoverModel albumCoverModel;
  AnimationController? _lottieController;

  @override
  AlbumDetailBloc? initBloc() => AlbumDetailBloc(albumCoverModel);

  _AlbumDetailPage(this.albumCoverModel){
    _lottieController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
      return SafeArea(
          child: Stack(
            children: [
              Container(
                color: CommonColor.black_33,
              ),
              BlocBuilder(
                  bloc: bloc,
                  builder: (context, state){
                    return CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      controller: scrollController,
                      slivers: _buildBody(state)
                    );
                  }
              )
            ],
          )
      );
  }

  Widget _buildViewLoading() {
    return SliverGrid.count(
      crossAxisCount: 1,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/lottie_loading.json",
              controller: _lottieController,
              onLoaded: (composition) {
                _lottieController!
                  ..duration = composition.duration
                  ..repeat();
              },
            ),
            RichText(
              text: TextSpan(
                  text: S.current.give_a_cond,
                  style: CommonStyle.textStyleCustom(size: 24.0)),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        )
      ],
    );
  }

  List<Widget> _buildListImages(AlbumModel? albumDetail){

    List<Widget> listWidgets = [];

    if(albumDetail?.photos == null || albumDetail?.photos?.isEmpty == true){
      listWidgets.add(_buildEmptyView());
    }

    List<Photo> data = albumDetail!.photos!;

    listWidgets.addAll([
      CupertinoSliverRefreshControl(
        onRefresh: () async {
          print("REFRESH");
        },
      ),
      SliverPadding(
        padding: EdgeInsets.all(0),
        sliver: SliverGrid.count(
            crossAxisCount: 2,
            children: List.generate(data.length, (index) {
              return Padding(
                  padding: EdgeInsets.only(
                      left: index % 2 == 0 ? 4 : 2,
                      right: index % 2 == 0 ? 2 : 4,
                      top: 4),
                  child: _buildItemImage(data[index]));
            })),
      ),
      SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.only(bottom: 16),
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      ),
    ]);

    return listWidgets;
  }

  Widget _buildViewError() {
    return Container(
      color: Colors.amber,
    );
  }

  Widget _buildEmptyView() {
    return GridView.count(crossAxisCount: 1, children: [
      Container(
          width: double.infinity,
          height: double.infinity,
          color: CommonColor.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/oops.png",
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: SizeConfig.verticalSize(5),
              ),
              RichText(
                text: TextSpan(
                    text: "Oops",
                    style: CommonStyle.textStyleCustom(
                      size: 24.0,
                    )),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.verticalSize(2),
              ),
              RichText(
                text: TextSpan(
                    text: S.current.empty_title,
                    style: CommonStyle.textStyleCustom(
                        size: 16.0, weight: FontWeight.normal)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.verticalSize(3),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey[200]?.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                            child: RichText(
                          text: const TextSpan(
                              text: "S.current.try_again",
                              style: CommonStyle.titleTextStyle),
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        const Flexible(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        )
                      ],
                    )),
              )
            ],
          ))
    ]);
  }

  Widget _buildItemImage(Photo photo) {
    String imgPath = photo.liked ? "assets/heart_solid.svg" : "assets/heart_empty.svg";
    return GestureDetector(
        onTap: () {
          _onClickImageItem(photo);
        },
        child: Stack(
          children: [
            Align(
              child: Center(
                  child: Hero(
                    tag: photo.id,
                    child:  FadeInImage.assetNetwork(
                      placeholder: 'assets/img_loading.gif',
                      image: photo.src?.tiny??"",
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                    ),
                  )
              )
            ),
            Align(
              child: GestureDetector(
                onTap: () {
                  photo.liked = !photo.liked;
                  setState(() {
                    imgPath = photo.liked
                        ? "assets/heart_solid.svg"
                        : "assets/heart_empty.svg";
                  });
                  bloc?.likePhoto(photo, photo.liked);
                },
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[100]?.withOpacity(0.5)),
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset(imgPath),
                  ),
                ),
              ),
              alignment: Alignment.bottomRight,
            )
          ],
        ));
  }

  @override
  void onLoadMore() {
    bloc?.loadMore();
  }

  void _onClickImageItem(Photo photo) {
    GlobalNavigator.pushPhotoDetailPage(context, photo);
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: CommonColor.primaryColor,
      pinned: true,
      snap: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: (){
          GlobalNavigator.back(context);
        },
      ),
      expandedHeight: 160,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: albumCoverModel.title,
            style: CommonStyle.normalTextStyleBold
          ),
        ),
        background: Hero(
          tag: albumCoverModel.title,
          child: ClipRRect(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/empty.png',
                image: albumCoverModel.assetsImageCover,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
      )
    );

  }

  List<Widget> _buildBody(Object? state) {
    List<Widget> listWidgets = [];
    listWidgets.add(_buildAppBar());

    if (state is AlbumDetailStateLoad){
      listWidgets.add(_buildViewLoading());
    }
    else if (state is AlbumDetailStateLoadingCompleted) {
      onLoadMoreCompleted();
      listWidgets.addAll(_buildListImages(state.album_detail));
    }
    else {
      listWidgets.add(_buildViewError());
    }
    return listWidgets;
  }

  @override
  void dispose() {
    _lottieController?.dispose();
    super.dispose();
  }
}