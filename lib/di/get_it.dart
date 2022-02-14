import 'package:get_it/get_it.dart';
import 'package:wallpaper/di/modules/repositories.dart';
import 'package:wallpaper/network/repositories/photo_repository.dart';
import 'package:wallpaper/network/repositories/translate_repository.dart';

final GetIt getIt = GetIt.instance;

void buildDependencies() async {
  registerRepoModule();
}

PhotoRepository getPhotoRepo() {
  return getIt.get<PhotoRepository>();
}

TranslateRepository getTranslateRepo() {
  return getIt.get<TranslateRepository>();
}