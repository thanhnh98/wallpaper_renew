
import 'package:json_annotation/json_annotation.dart';
part 'photo_src.g.dart';

@JsonSerializable()
class PhotoSource{
  String original;
  String large2x;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;


  PhotoSource(this.original, this.large2x, this.large, this.medium, this.small,
      this.portrait, this.landscape, this.tiny);

  factory PhotoSource.fromJson(Map<String, dynamic> json) => _$PhotoSourceFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoSourceToJson(this);
}