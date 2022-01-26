
import 'package:wallpaper/network/repositories/photo_repository.dart';

import '../get_it.dart';

void registerRepoModule() async{
  getIt.registerSingleton<PhotoRepository>(PhotoRepository(), signalsReady: true);
}