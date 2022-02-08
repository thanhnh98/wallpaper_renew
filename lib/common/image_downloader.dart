import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:wallpaper/model/download_image.dart';

Future<DownloadImageModel> downloadImage(String url) async {
  String? fileName;
  String? path;
  int? size;
  String? mimeType;

  try {
    // Saved with this method.
    var imageId = await ImageDownloader.downloadImage(url);
    if (imageId != null) {
      // Below is a method of obtaining saved image information.
      fileName = await ImageDownloader.findName(imageId);
      path = await ImageDownloader.findPath(imageId);
      size = await ImageDownloader.findByteSize(imageId);
      mimeType = await ImageDownloader.findMimeType(imageId);
    }
  } on PlatformException catch (error) {
    print(error);
  }

  return DownloadImageModel(
      fileName,
      path,
      size,
      mimeType
  );
}