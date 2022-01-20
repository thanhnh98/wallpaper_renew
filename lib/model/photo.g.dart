// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo()
  ..id = json['id'] as int
  ..width = json['width'] as int?
  ..height = json['height'] as int?
  ..url = json['url'] as String?
  ..photographer = json['photographer'] as String?
  ..photographer_url = json['photographer_url'] as String?
  ..photographer_id = json['photographer_id'] as int?
  ..avg_color = json['avg_color'] as String
  ..src = json['src'] == null
      ? null
      : PhotoSource.fromJson(json['src'] as Map<String, dynamic>)
  ..liked = json['liked'] as bool;

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'photographer': instance.photographer,
      'photographer_url': instance.photographer_url,
      'photographer_id': instance.photographer_id,
      'avg_color': instance.avg_color,
      'src': instance.src,
      'liked': instance.liked,
    };
