import 'package:json_annotation/json_annotation.dart';

part 'google_search_info_vo.g.dart';

@JsonSerializable()
class GoogleSearchInfoVO {
  @JsonKey(name: 'textSnippet')
  String? textSnippet;
  GoogleSearchInfoVO({
    this.textSnippet,
  });

  factory GoogleSearchInfoVO.fromJson(Map<String, dynamic> json) =>
      _$GoogleSearchInfoVOFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSearchInfoVOToJson(this);
}
