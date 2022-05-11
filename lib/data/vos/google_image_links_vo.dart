import 'package:json_annotation/json_annotation.dart';

part 'google_image_links_vo.g.dart';

@JsonSerializable()
class GoogleImageLinksVO {
  @JsonKey(name: 'smallThumbnail')
  String? smallThumbail;
  @JsonKey(name: 'thumbnail')
  String? thumbail;

  GoogleImageLinksVO({
    this.smallThumbail,
    this.thumbail,
  });

  factory GoogleImageLinksVO.fromJson(Map<String, dynamic> json) => _$GoogleImageLinksVOFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleImageLinksVOToJson(this);

  
}
