// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_src.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoSource _$PhotoSourceFromJson(Map<String, dynamic> json) => PhotoSource(
      json['original'] as String,
      json['large2x'] as String,
      json['large'] as String,
      json['medium'] as String,
      json['small'] as String,
      json['portrait'] as String,
      json['landscape'] as String,
      json['tiny'] as String,
    );

Map<String, dynamic> _$PhotoSourceToJson(PhotoSource instance) =>
    <String, dynamic>{
      'original': instance.original,
      'large2x': instance.large2x,
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
      'portrait': instance.portrait,
      'landscape': instance.landscape,
      'tiny': instance.tiny,
    };
