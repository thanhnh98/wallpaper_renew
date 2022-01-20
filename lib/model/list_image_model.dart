import 'package:json_annotation/json_annotation.dart';
import 'package:wallpaper/model/photo.dart';
part 'list_image_model.g.dart';

@JsonSerializable()
class ListImageModel{

  ListImageModel({this.nextPage, this.photos});
  String? nextPage = "";
  List<Photo>? photos = [];

  factory ListImageModel.fromJson(Map<String, dynamic> json) => _$ListImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ListImageModelToJson(this);
}