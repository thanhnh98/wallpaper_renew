import 'package:json_annotation/json_annotation.dart';
import 'package:wallpaper/model/photo.dart';
part 'album.g.dart';

@JsonSerializable()
class AlbumModel{

  AlbumModel({this.page, this.per_page, this.photos, this.url, this.total_results, this.next_page});

  int? page;
  int? per_page;
  List<Photo>? photos;
  String? url;
  int? total_results;
  String? next_page;

  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);

  AlbumModel clone(){
    return AlbumModel(
        page: this.page,
        per_page: this.per_page,
        photos: this.photos,
        url: this.url,
        total_results: this.total_results,
        next_page: this.next_page);
  }
}