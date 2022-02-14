import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpaper/base/widget/base.dart';
import 'package:wallpaper/common/color_utils.dart';
import 'package:wallpaper/common/navigator.dart';
import 'package:wallpaper/common/style_utils.dart';
import 'package:wallpaper/generated/l10n.dart';
import 'package:wallpaper/model/language.dart';
import 'package:wallpaper/presentation/bloc/search_bloc.dart';
import 'package:wallpaper/presentation/events/search_event_state.dart';
import 'package:wallpaper/presentation/screen/search_result_page.dart';
import 'package:wallpaper/widgets/language_switcher.dart';

class SearchPage extends BaseStatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends BaseStateWidget<SearchPage, SearchBloc> {
  bool isFocused = true;
  FocusNode focusNode = FocusNode();
  LanguageSwitcherController? _languageSwitcherController = LanguageSwitcherController();

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
                print("state: ${state.language}");
                return SearchResultPage(state, (){
                  bloc?.reInit(
                      state.keyword,
                      state.keywordTranslated,
                      state.language
                  );
                });
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

    if (state is SearchStateInit ){
      bodyWidget = _buildSearchBar(state);
    }

    if (state is SearchStateLoadCompleted){
      bodyWidget = _buildSearchBar(state);
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

  Widget _buildSearchBar(SearchState state) {
    String? keyword = state.keyword;
    String? keywordTranslated = state.keywordTranslated;
    Language? language = state.language;
    print("language: $language");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: S.current.slogan_search,
              style: CommonStyle.textStyleCustom(
                  size: CommonStyle.super_extra_text_size,
                  weight: FontWeight.bold
              )
            )
        ),
        const SizedBox(
          height: 32,
        ),
        Hero(
            tag: "search_bar",
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                  margin: const EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 16),
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
                        print("search on lang: ${ _languageSwitcherController?.currentLanguage}");

                        if(text.isNotEmpty) {
                          bloc?.requestSearch(text, _languageSwitcherController?.currentLanguage??Language.VI);
                        }
                      },
                    ),
                  )),
            )
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: LanguageSwitcher(
            controller: _languageSwitcherController,
            defaultLanguage: language??Language.VI,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBarOnSearching(String content){
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
              tag: "search_bar",
              child: RichText(
                  text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: "Searching for ",
                            style: CommonStyle.textStyleCustom(
                                size: CommonStyle.large_text_size,
                                color: CommonColor.white,
                                fontStyle: FontStyle.normal,
                                weight: FontWeight.normal
                            )
                        ),
                        TextSpan(
                            text: "\"$content\"",
                            style: CommonStyle.textStyleCustom(
                                size: CommonStyle.larger_text_size,
                                color: CommonColor.white,
                                fontStyle: FontStyle.normal,
                                weight: FontWeight.bold
                            )
                        )
                      ]
                  )
              )
          ),
          Lottie.asset("assets/finding_image.json")
        ],
      ),
    );
  }
}
