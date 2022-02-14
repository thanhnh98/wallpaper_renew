
import 'package:wallpaper/network/repositories/photo_repository.dart';
import 'package:wallpaper/network/repositories/translate_repository.dart';

import '../get_it.dart';

void registerRepoModule() async{
  getIt.registerSingleton<PhotoRepository>(PhotoRepository(), signalsReady: true);
  getIt.registerSingleton<TranslateRepository>(TranslateRepository(), signalsReady: true);
}