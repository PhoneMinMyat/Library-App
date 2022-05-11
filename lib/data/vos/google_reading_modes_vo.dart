import 'package:json_annotation/json_annotation.dart';

part 'google_reading_modes_vo.g.dart';

@JsonSerializable()
class ReadingModesVO {
  @JsonKey(name: 'text')
  bool? text;
  @JsonKey(name: 'image')
  bool? image;

  ReadingModesVO({
    this.text,
    this.image,
  });

  factory ReadingModesVO.fromJson(Map<String, dynamic> json) =>
      _$ReadingModesVOFromJson(json);

  Map<String, dynamic> toJson() => _$ReadingModesVOToJson(this);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReadingModesVO &&
        other.text == text &&
        other.image == image;
  }

  @override
  int get hashCode => text.hashCode ^ image.hashCode;
}
