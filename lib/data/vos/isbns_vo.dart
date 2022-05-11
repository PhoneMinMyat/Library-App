import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/persistence/hive_constants.dart';

part 'isbns_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_ISBN_VO, adapterName: 'IsbnVOAdapter')
class IsbnsVO {
  @JsonKey(name: 'isbn10')
  @HiveField(0)
  String? isbn10;

  @JsonKey(name: 'isbn13')
  @HiveField(1)
  String? isbn12;
  IsbnsVO({
    this.isbn10,
    this.isbn12,
  });

  factory IsbnsVO.fromJson(Map<String, dynamic> json) => _$IsbnsVOFromJson(json);

  Map<String, dynamic> toJson() => _$IsbnsVOToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IsbnsVO && other.isbn10 == isbn10 && other.isbn12 == isbn12;
  }

  @override
  int get hashCode => isbn10.hashCode ^ isbn12.hashCode;

  @override
  String toString() => 'IsbnsVO(isbn10: $isbn10, isbn12: $isbn12)';
}
