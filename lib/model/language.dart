enum Language {
  VI,
  EN
}

String getLanguageValue(Language language){
  if (language == Language.VI) {
    return "vi";
  } else {
    return "en";
  }
}