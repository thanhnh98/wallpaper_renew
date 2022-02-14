// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslateModel _$TranslateModelFromJson(Map<String, dynamic> json) =>
    TranslateModel(
      (json['translations'] as List<dynamic>)
          .map((e) => TranslationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['word_count'] as int?,
      json['character_count'] as int?,
    );

Map<String, dynamic> _$TranslateModelToJson(TranslateModel instance) =>
    <String, dynamic>{
      'translations': instance.translations,
      'word_count': instance.word_count,
      'character_count': instance.character_count,
    };
