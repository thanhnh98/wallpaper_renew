import 'dart:async';

import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/common/navigator.dart';
import 'package:wallpaper/presentation/events/search_event_state.dart';

class SearchBloc extends BaseBloc<SearchEvent, SearchState>{
  SearchBloc() : super(SearchStateInit()){
    on((event, emit) => {
        if(event is SearchEventSearching){
          emit.call(SearchStateSearching(event.keyword))
        }

        else if(event is SearchEventLoadCompleted){
          emit.call(SearchStateLoadCompleted(event.keyword))
        }
    });
  }
  void requestSearch(String content){
    print("searching: $content");
    add(SearchEventSearching(content));
    Timer(const Duration(seconds: 1), () {
      add(SearchEventLoadCompleted(content));
    });
  }
}