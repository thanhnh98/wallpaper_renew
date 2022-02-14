import 'package:wallpaper/base/bloc/base.dart';
import 'package:wallpaper/model/language.dart';

class SearchEvent extends BaseEvent{
  String? keyword;
  String? keywordTranslated;
  Language? language;
  SearchEvent(this.keyword, this.keywordTranslated, this.language);
}
class SearchEventInitial extends SearchEvent{
  String? keyword;
  String? keywordTranslated;
  Language? language;
  SearchEventInitial(this.keyword, this.keywordTranslated, this.language): super(keyword, keywordTranslated, language);
}

class SearchEventLoadCompleted extends SearchEvent{
  String? keyword;
  String? keywordTranslated;
  Language? language;
  SearchEventLoadCompleted(this.keyword, this.keywordTranslated, this.language): super(keyword, keywordTranslated, language);
}
class SearchEventSearching extends SearchEvent{
  String? keyword;
  Language? language;
  SearchEventSearching(this.keyword, this.language): super(keyword, null, language);
}

class SearchState extends BaseState{
  String? keyword;
  String? keywordTranslated;
  Language? language;
  SearchState(this.keyword, this.keywordTranslated, this.language);
}
class SearchStateInit extends SearchState{
  String? keyword;
  String? keywordTranslated;
  Language? language;
  SearchStateInit({this.keyword, this.keywordTranslated, this.language}): super(keyword, keywordTranslated, language);
}
class SearchStateSearching extends SearchState{
  String? keyword;
  String? keywordTranslated;
  Language? language;
  SearchStateSearching(this.keyword, this.language, {this.keywordTranslated}): super(keyword, keywordTranslated, language);
}
class SearchStateLoadCompleted extends SearchState{
  String? keyword;
  String? keywordTranslated;
  Language? language;
  SearchStateLoadCompleted(this.keyword, this.keywordTranslated, this.language): super(keyword, keywordTranslated, language);
}