// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OverviewVOAdapter extends TypeAdapter<OverviewVO> {
  @override
  final int typeId = 4;

  @override
  OverviewVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OverviewVO(
      bestSellerDate: fields[0] as String?,
      publishedDate: fields[1] as String?,
      publishedDateDescription: fields[2] as String?,
      previousPublishedDate: fields[3] as String?,
      nextPublishedDate: fields[4] as String?,
      bookListsList: (fields[5] as List?)?.cast<BookListVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, OverviewVO obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.bestSellerDate)
      ..writeByte(1)
      ..write(obj.publishedDate)
      ..writeByte(2)
      ..write(obj.publishedDateDescription)
      ..writeByte(3)
      ..write(obj.previousPublishedDate)
      ..writeByte(4)
      ..write(obj.nextPublishedDate)
      ..writeByte(5)
      ..write(obj.bookListsList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OverviewVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverviewVO _$OverviewVOFromJson(Map<String, dynamic> json) => OverviewVO(
      bestSellerDate: json['bestsellers_date'] as String?,
      publishedDate: json['published_date'] as String?,
      publishedDateDescription: json['published_date_description'] as String?,
      previousPublishedDate: json['previous_published_date'] as String?,
      nextPublishedDate: json['next_published_date'] as String?,
      bookListsList: (json['lists'] as List<dynamic>?)
          ?.map((e) => BookListVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OverviewVOToJson(OverviewVO instance) =>
    <String, dynamic>{
      'bestsellers_date': instance.bestSellerDate,
      'published_date': instance.publishedDate,
      'published_date_description': instance.publishedDateDescription,
      'previous_published_date': instance.previousPublishedDate,
      'next_published_date': instance.nextPublishedDate,
      'lists': instance.bookListsList,
    };
