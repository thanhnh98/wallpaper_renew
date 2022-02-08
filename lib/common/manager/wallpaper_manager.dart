import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:wallpaper/channel/method_channel.dart';
import 'package:wallpaper/model/download_image.dart';

class WallpaperManager {
    static final MethodChannel _wallpaperMethodChannel = AppMethodChannel.channelUpdateWallpaper;

    static Future<DownloadImageModel> createWallpaperChooser(DownloadImageModel downloadImageModel) async {
    await _wallpaperMethodChannel.invokeMethod("set-background", downloadImageModel.path);
      return downloadImageModel;
    }
}