import 'dart:async';

import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/common/navigator.dart';
import 'package:wallpaper/di/get_it.dart';
import 'package:wallpaper/model/base_response.dart';
import 'package:wallpaper/model/language.dart';
import 'package:wallpaper/model/translate_model.dart';
import 'package:wallpaper/network/repositories/translate_repository.dart';
import 'package:wallpaper/presentation/events/search_event_state.dart';

class SearchBloc extends BaseBloc<SearchEvent, SearchState>{
  TranslateRepository translateRepo = getTranslateRepo();

  SearchBloc() : super(SearchStateInit()){
    on((event, emit) => {
        if (event is SearchEventInitial){
          emit.call(SearchStateInit(
            keyword: event.keyword,
            keywordTranslated: event.keywordTranslated,
            language: event.language
          ))
        }
        else if(event is SearchEventSearching){
          emit.call(SearchStateSearching(event.keyword, event.language))
        }
        else if(event is SearchEventLoadCompleted){
          emit.call(SearchStateLoadCompleted(event.keyword, event.keywordTranslated, event.language))
        }
    });
  }
  void requestSearch(String keyword, Language language) async {
    add(SearchEventSearching(keyword, language));
    if (language == Language.VI) {
      BaseResponse<TranslateModel?> res = await translateRepo.translateText(keyword);
      if(res is Failed<TranslateModel>){
        print("res: ${res.message}");
      }
      else if (res is Successful<TranslateModel?>) {
        TranslateModel? translated = res.data;
        if (translated != null
            && translated.translations != null
            && translated.translations.isNotEmpty == true
            && translated.translations[0] != null) {
          add(SearchEventLoadCompleted(
              keyword, translated.translations[0].translation, language));
        }
      }
    }
    else {
      Timer(const Duration(milliseconds: 1000), (){
        add(SearchEventLoadCompleted(keyword, keyword, language));
      });
    }
  }

  void reInit(String? keyword, String? keywordTranslated, Language? language){
      add(SearchEventInitial(keyword, keywordTranslated, language));
  }
}