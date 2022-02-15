import 'package:wallpaper/app_config.dart';

import '../get_it.dart';

void registerAppConfig(String flavorName){
  if (flavorName == "dev"){
    getIt.registerSingleton<AppConfig>(AppConfig(
      "Wallpaper Dev",
      flavorName,
        variants: {
          "PHOTO_BASE_URL":"https://api.pexels.com",
          "IBM_BASE_URL":"https://api.us-east.language-translator.watson.cloud.ibm.com/instances/3058864d-8fa7-4c94-9363-47dde4251447"
        }
    ), signalsReady: true);
  }
  else {
    getIt.registerSingleton<AppConfig>(AppConfig(
        "Wallpaper",
        flavorName,
        variants: {
          "PHOTO_BASE_URL":"https://api.pexels.com",
          "IBM_BASE_URL":"https://api.us-east.language-translator.watson.cloud.ibm.com/instances/3058864d-8fa7-4c94-9363-47dde4251447"
        }
    ), signalsReady: true);
  }
}