import 'package:json_annotation/json_annotation.dart';

import 'package:library_app/data/vos/google_book_vo.dart';
import 'package:library_app/data/vos/google_search_info_vo.dart';

part 'google_item_vo.g.dart';

@JsonSerializable()
class GoogleItemVO {
  @JsonKey(name: 'kind')
  String? kind;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'etag')
  String? etag;

  @JsonKey(name: 'selfLink')
  String? selfLink;

  @JsonKey(name: 'volumeInfo')
  GoogleBookVO? volumeInfo;

  @JsonKey(name: 'searchInfo')
  GoogleSearchInfoVO? searchInfo;
  GoogleItemVO({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.searchInfo,
  });

  factory GoogleItemVO.fromJson(Map<String, dynamic> json) =>
      _$GoogleItemVOFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleItemVOToJson(this);
}
