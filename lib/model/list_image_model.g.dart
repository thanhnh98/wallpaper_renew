// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListImageModel _$ListImageModelFromJson(Map<String, dynamic> json) =>
    ListImageModel(
      nextPage: json['nextPage'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListImageModelToJson(ListImageModel instance) =>
    <String, dynamic>{
      'nextPage': instance.nextPage,
      'photos': instance.photos,
    };
