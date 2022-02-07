import 'package:wallpaper/base/bloc/base.dart';

class SearchEvent extends BaseEvent{}
class SearchEventLoadCompleted extends SearchEvent{
  String? keyword;
  SearchEventLoadCompleted({this.keyword});
}
class SearchEventSearching extends SearchEvent{
  String? keyword;
  SearchEventSearching({this.keyword});
}

class SearchState extends BaseState{}
class SearchStateInit extends SearchState{}
class SearchStateSearching extends SearchState{
  String? keyword;
  SearchStateSearching({this.keyword});
}
class SearchStateLoadCompleted extends SearchState{
  String? keyword;
  SearchStateLoadCompleted({this.keyword});
}