import 'package:json_annotation/json_annotation.dart';

import 'package:library_app/data/vos/google_item_vo.dart';

part 'get_google_api_responses.g.dart';

@JsonSerializable()
class GoogleBookApiResponse {
  @JsonKey(name: 'kind')
  String? kind;

  @JsonKey(name: 'totalItems')
  int? totalItems;

  @JsonKey(name: 'items')
  List<GoogleItemVO>? items;
  GoogleBookApiResponse({
    this.kind,
    this.totalItems,
    this.items,
  });

  factory GoogleBookApiResponse.fromJson(Map<String, dynamic> json) =>
      _$GoogleBookApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleBookApiResponseToJson(this);
}
