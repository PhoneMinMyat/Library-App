import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/persistence/hive_constants.dart';

part 'buy_link_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_BUY_LINK_VO, adapterName: 'BuyLinkVOAdapter')
class BuyLinkVO {
  @JsonKey(name: 'name')
  @HiveField(0)
  String? name;

  @JsonKey(name: 'url')
  @HiveField(1)
  String? url;

  BuyLinkVO({
    this.name,
    this.url,
  });

  factory BuyLinkVO.fromJson(Map<String, dynamic> json) =>
      _$BuyLinkVOFromJson(json);

  Map<String, dynamic> toJson() => _$BuyLinkVOToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BuyLinkVO && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;

  @override
  String toString() => 'BuyLinkVO(name: $name, url: $url)';
}
