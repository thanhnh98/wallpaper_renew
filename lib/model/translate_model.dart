import 'package:json_annotation/json_annotation.dart';
import 'package:wallpaper/model/translation_model.dart';
part 'translate_model.g.dart';
@JsonSerializable()
class TranslateModel{
  List<TranslationModel> translations;
  int? word_count;
  int? character_count;

  TranslateModel(this.translations, this.word_count, this.character_count);

  factory TranslateModel.fromJson(Map<String, dynamic> json) => _$TranslateModelFromJson(json);
  Map<String, dynamic> toJson() => _$TranslateModelToJson(this);
}