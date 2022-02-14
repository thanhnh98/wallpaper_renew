
import 'package:json_annotation/json_annotation.dart';
part 'translation_model.g.dart';

@JsonSerializable()
class TranslationModel{
  TranslationModel(this.translation);
  String translation;

  factory TranslationModel.fromJson(Map<String, dynamic> json) => _$TranslationModelFromJson(json);
  Map<String, dynamic> toJson() => _$TranslationModelToJson(this);
}