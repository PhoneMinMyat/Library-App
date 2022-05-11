import 'package:json_annotation/json_annotation.dart';

part 'google_idustry_identifiers_vo.g.dart';

@JsonSerializable()
class GoogleIdustryIdentifiersVO {
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'identifier')
  String? identifier;
  GoogleIdustryIdentifiersVO({
    this.type,
    this.identifier,
  });

  factory GoogleIdustryIdentifiersVO.fromJson(Map<String, dynamic> json) =>
      _$GoogleIdustryIdentifiersVOFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleIdustryIdentifiersVOToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GoogleIdustryIdentifiersVO &&
      other.type == type &&
      other.identifier == identifier;
  }

  @override
  int get hashCode => type.hashCode ^ identifier.hashCode;
}
