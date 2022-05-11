// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookListVOAdapter extends TypeAdapter<BookListVO> {
  @override
  final int typeId = 1;

  @override
  BookListVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookListVO(
      listId: fields[0] as int?,
      listName: fields[1] as String?,
      listNameEncoded: fields[2] as String?,
      displayName: fields[3] as String?,
      updated: fields[4] as String?,
      listImage: fields[5] as String?,
      listImageWidth: fields[6] as String?,
      listImageHeight: fields[7] as String?,
      booksList: (fields[8] as List?)?.cast<BookVO>(),
      bestSellerDate: fields[9] as String?,
      publishedDate: fields[10] as String?,
      rank: fields[11] as int?,
      rankLastWeek: fields[12] as int?,
      weeksOnList: fields[13] as int?,
      asterisk: fields[14] as int?,
      dagger: fields[15] as int?,
      amazonProductUrl: fields[16] as String?,
      isbns: (fields[17] as List?)?.cast<IsbnsVO>(),
      details: (fields[18] as List?)?.cast<BookVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, BookListVO obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.listId)
      ..writeByte(1)
      ..write(obj.listName)
      ..writeByte(2)
      ..write(obj.listNameEncoded)
      ..writeByte(3)
      ..write(obj.displayName)
      ..writeByte(4)
      ..write(obj.updated)
      ..writeByte(5)
      ..write(obj.listImage)
      ..writeByte(6)
      ..write(obj.listImageWidth)
      ..writeByte(7)
      ..write(obj.listImageHeight)
      ..writeByte(8)
      ..write(obj.booksList)
      ..writeByte(9)
      ..write(obj.bestSellerDate)
      ..writeByte(10)
      ..write(obj.publishedDate)
      ..writeByte(11)
      ..write(obj.rank)
      ..writeByte(12)
      ..write(obj.rankLastWeek)
      ..writeByte(13)
      ..write(obj.weeksOnList)
      ..writeByte(14)
      ..write(obj.asterisk)
      ..writeByte(15)
      ..write(obj.dagger)
      ..writeByte(16)
      ..write(obj.amazonProductUrl)
      ..writeByte(17)
      ..write(obj.isbns)
      ..writeByte(18)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookListVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookListVO _$BookListVOFromJson(Map<String, dynamic> json) => BookListVO(
      listId: json['list_id'] as int?,
      listName: json['list_name'] as String?,
      listNameEncoded: json['list_name_encoded'] as String?,
      displayName: json['display_name'] as String?,
      updated: json['updated'] as String?,
      listImage: json['list_image'] as String?,
      listImageWidth: json['list_image_width'] as String?,
      listImageHeight: json['list_image_height'] as String?,
      booksList: (json['books'] as List<dynamic>?)
          ?.map((e) => BookVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestSellerDate: json['bestsellers_date'] as String?,
      publishedDate: json['published_date'] as String?,
      rank: json['rank'] as int?,
      rankLastWeek: json['rank_last_week'] as int?,
      weeksOnList: json['weeks_on_list'] as int?,
      asterisk: json['asterisk'] as int?,
      dagger: json['dagger'] as int?,
      amazonProductUrl: json['amazon_product_url'] as String?,
      isbns: (json['isbns'] as List<dynamic>?)
          ?.map((e) => IsbnsVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      details: (json['book_details'] as List<dynamic>?)
          ?.map((e) => BookVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookListVOToJson(BookListVO instance) =>
    <String, dynamic>{
      'list_id': instance.listId,
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'display_name': instance.displayName,
      'updated': instance.updated,
      'list_image': instance.listImage,
      'list_image_width': instance.listImageWidth,
      'list_image_height': instance.listImageHeight,
      'books': instance.booksList,
      'bestsellers_date': instance.bestSellerDate,
      'published_date': instance.publishedDate,
      'rank': instance.rank,
      'rank_last_week': instance.rankLastWeek,
      'weeks_on_list': instance.weeksOnList,
      'asterisk': instance.asterisk,
      'dagger': instance.dagger,
      'amazon_product_url': instance.amazonProductUrl,
      'isbns': instance.isbns,
      'book_details': instance.details,
    };
