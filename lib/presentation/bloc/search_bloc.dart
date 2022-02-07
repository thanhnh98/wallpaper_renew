import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/presentation/events/search_event_state.dart';

class SearchBloc extends BaseBloc<SearchEvent, SearchState>{
  SearchBloc() : super(SearchStateInit()){
    on((event, emit) => {
        if(event is SearchEventSearching){
          emit.call(SearchStateSearching(keyword: event.keyword))
        }

        else if(event is SearchEventLoadCompleted){
          emit.call(SearchStateLoadCompleted())
        }
    });
  }
  void requestSearch(String content){
    add(SearchEventSearching(keyword: content));
  }
}