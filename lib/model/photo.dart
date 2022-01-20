
import 'package:json_annotation/json_annotation.dart';
import 'package:wallpaper/model/photo_src.dart';
part 'photo.g.dart';

@JsonSerializable()
class Photo{
  Photo();

  int id = 0;
  int? width;
  int? height;
  String? url;
  String? photographer;
  String? photographer_url;
  int? photographer_id;
  String avg_color = "";
  PhotoSource? src;
  bool liked = false;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoToJson(this);

}