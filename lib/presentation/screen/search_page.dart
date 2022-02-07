import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/base/widget/base.dart';
import 'package:wallpaper/common/color_utils.dart';
import 'package:wallpaper/common/navigator.dart';
import 'package:wallpaper/common/sized_config.dart';
import 'package:wallpaper/common/style_utils.dart';
import 'package:wallpaper/generated/l10n.dart';
import 'package:wallpaper/presentation/bloc/search_bloc.dart';
import 'package:wallpaper/presentation/events/search_event_state.dart';

class SearchPage extends BaseStatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends BaseStateWidget<SearchPage, SearchBloc> {
  bool isFocused = true;
  FocusNode focusNode = FocusNode();

  _SearchPageState(){
    focusNode.addListener(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: CommonColor.primaryColor,
        body: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if (state is SearchStateInit) {
                return _buildBody(state);
              } else if (state is SearchStateSearching) {
                return _buildBody(state);
              } else if (state is SearchStateLoadCompleted) {

              }
              return Container();
            }),
      ),
    );
  }

  @override
  SearchBloc? initBloc() => SearchBloc();

  Widget _buildBody(SearchState state) {
    Widget bodyWidget = Container();

    if (state is SearchStateInit){
      bodyWidget = _buildSearchBar();
    }
    if (state is SearchStateSearching) {
      bodyWidget = _buildSearchBarOnSearching(state.keyword??"");
    }

    return Stack(children: [
      Positioned(
        left: 0,
        top: 32,
        child: IconButton(
          icon: const Icon(
              Icons.arrow_back,
              color: Colors.white
          ),
          onPressed: () {
            GlobalNavigator.back(context);
          },
        ),
      ),
      Align(
          alignment: Alignment(-1, 0),
          child: bodyWidget
      )
    ]);
  }

  Widget _buildSearchBar() {
    return Hero(
        tag: "search",
        child: Material(
          type: MaterialType.transparency,
          child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.7)),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  enableInteractiveSelection: false,
                  autofocus: true,
                  textAlignVertical: TextAlignVertical.center,
                  maxLines: 1,
                  style: CommonStyle.textStyleCustom(
                      size: 20.0, weight: FontWeight.normal),
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.current.search,
                      hintStyle: CommonStyle.textStyleCustom(
                          size: 20.0, weight: FontWeight.normal),
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                  onSubmitted: (text) {
                    if(text.isNotEmpty) {
                      bloc?.requestSearch(text);
                    }
                  },
                ),
              )),
        ));
  }

  Widget _buildSearchBarOnSearching(String content){
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                        text: "Searching for ",
                        style: CommonStyle.normalTextStyle
                    ),
                    TextSpan(
                        text: "\"content\"",
                        style: CommonStyle.normalTextStyleBold
                    )
                  ]
              )
          )
        ],
      ),
    );
  }
}
