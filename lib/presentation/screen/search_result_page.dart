import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpaper/base/widget/base.dart';
import 'package:wallpaper/common/color_utils.dart';
import 'package:wallpaper/common/navigator.dart';
import 'package:wallpaper/common/style_utils.dart';
import 'package:wallpaper/generated/l10n.dart';
import 'package:wallpaper/model/photo.dart';
import 'package:wallpaper/presentation/bloc/search_result_bloc.dart';
import 'package:wallpaper/presentation/events/search_event_state.dart';
import 'package:wallpaper/presentation/events/search_result_state_event.dart';

class SearchResultPage extends BaseStatefulWidget {
  SearchStateLoadCompleted? searchCompletedState;
  Function onBack;
  SearchResultPage(this.searchCompletedState, this.onBack, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchResultPageState(searchCompletedState, onBack);
}

class _SearchResultPageState extends BaseStateCollectionWidget<SearchResultPage, SearchResultBloc> {
  SearchStateLoadCompleted? searchCompletedState;
  Function onBack;
  _SearchResultPageState(this.searchCompletedState, this.onBack);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: CommonColor.black_33,
        ),
        BlocBuilder(
        bloc: bloc,
        builder: (context, state){
          if (state is SearchResultStateLoaded) {
            onLoadMoreCompleted();
          }
          return _buildBody(state);
        }
        )
      ],
    );
  }

  @override
  SearchResultBloc? initBloc() {
     return SearchResultBloc(searchCompletedState);
  }

  @override
  void onLoadMore() {
    bloc?.loadMore();
  }

  Widget _buildBody(Object? state) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      slivers: _buildSlivers(state),
    );
  }

  List<Widget> _buildSlivers(Object? state) {
    List<Widget> widgets = [];
    widgets.add(_buildAppBar());

    if (state is SearchResultStateLoading){
      widgets.add(_buildLoading());
    }

    if (state is SearchResultStateLoaded){
      List<Photo> data = state.albumModel?.photos??[];
      if (state.albumModel == null || state.albumModel?.photos == null || state.albumModel?.photos?.length == 0)
        widgets.add(_buildEmpty());
      else {
        widgets.addAll([
          CupertinoSliverRefreshControl(
            builder: (context, mode, v1, v2, v3){
              return Container(
                width: 50,
                child: Lottie.asset("assets/lottie_loading.json"),
              );
            },
            onRefresh: () async {
              print("REFRESH");
            },
          ),
          SliverPadding(
            padding: const EdgeInsets.all(0),
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
                height: shouldShowLoadMore() ? 100 : 0,
                padding: const EdgeInsets.only(bottom: 16, top: 16),
                alignment: Alignment.center,
                child: Lottie.asset("assets/loading_more.json")
            ),
          ),
        ]);
      }
    }
    return widgets;
  }

  Widget _buildEmpty() {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset("assets/empty_image.png"),
          SizedBox(
            height: 20,
          ),
          RichText(text: TextSpan(
            children: [
              const TextSpan(
                text: "Không tìm thấy kết quả cho: ",
                style: CommonStyle.normalTextStyle
              ),
              TextSpan(
                text: "\"${this.searchCompletedState?.keyword}\"",
                style: CommonStyle.normalTextStyleBold
              )
            ]
          ))
        ]
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
        backgroundColor: CommonColor.primaryColor,
        pinned: true,
        snap: false,
        leading: IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: (){
            onBack();
          },
        ),
        flexibleSpace: Hero(
          tag: "search_bar",
          child: FlexibleSpaceBar(
            title: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  children: [
                    TextSpan(
                        text: S.current.result_for,
                        style: CommonStyle.normalTextStyle
                    ),
                    TextSpan(
                        text: "\"${searchCompletedState?.keyword}\"",
                        style: CommonStyle.normalTextStyleBold
                    )
                  ]
              ),
            ),
          ),
        )
    );
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

  Widget _buildLoading() {
    return SliverToBoxAdapter(
      child: Lottie.asset("assets/lottie_loading.json"),
    );
  }

  @override
  bool shouldShowLoadMore() {
    return bloc?.state.albumModel?.next_page != null;
  }

  void _onClickImageItem(Photo photo) {
    GlobalNavigator.pushPhotoDetailPage(context, photo);
  }
}