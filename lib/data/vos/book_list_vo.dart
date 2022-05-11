import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/isbns_vo.dart';
import 'package:library_app/persistence/hive_constants.dart';

part 'book_list_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_BOOK_LIST_VO, adapterName: 'BookListVOAdapter')
class BookListVO {
  @JsonKey(name: 'list_id')
  @HiveField(0)
  int? listId;

  @JsonKey(name: 'list_name')
  @HiveField(1)
  String? listName;

  @JsonKey(name: 'list_name_encoded')
  @HiveField(2)
  String? listNameEncoded;

  @JsonKey(name: 'display_name')
  @HiveField(3)
  String? displayName;

  @JsonKey(name: 'updated')
  @HiveField(4)
  String? updated;

  @JsonKey(name: 'list_image')
  @HiveField(5)
  String? listImage;

  @JsonKey(name: 'list_image_width')
  @HiveField(6)
  String? listImageWidth;

  @JsonKey(name: 'list_image_height')
  @HiveField(7)
  String? listImageHeight;

  @JsonKey(name: 'books')
  @HiveField(8)
  List<BookVO>? booksList;

  @JsonKey(name: 'bestsellers_date')
  @HiveField(9)
  String? bestSellerDate;

  @JsonKey(name: 'published_date')
  @HiveField(10)
  String? publishedDate;

  @JsonKey(name: 'rank')
  @HiveField(11)
  int? rank;

  @JsonKey(name: 'rank_last_week')
  @HiveField(12)
  int? rankLastWeek;

  @JsonKey(name: 'weeks_on_list')
  @HiveField(13)
  int? weeksOnList;

  @JsonKey(name: 'asterisk')
  @HiveField(14)
  int? asterisk;

  @JsonKey(name: 'dagger')
  @HiveField(15)
  int? dagger;

  @JsonKey(name: 'amazon_product_url')
  @HiveField(16)
  String? amazonProductUrl;

  @JsonKey(name: 'isbns')
  @HiveField(17)
  List<IsbnsVO>? isbns;

  @JsonKey(name: 'book_details')
  @HiveField(18)
  List<BookVO>? details;


  BookListVO({
    this.listId,
    this.listName,
    this.listNameEncoded,
    this.displayName,
    this.updated,
    this.listImage,
    this.listImageWidth,
    this.listImageHeight,
    this.booksList,
    this.bestSellerDate,
    this.publishedDate,
    this.rank,
    this.rankLastWeek,
    this.weeksOnList,
    this.asterisk,
    this.dagger,
    this.amazonProductUrl,
    this.isbns,
    this.details,
  });

  factory BookListVO.fromJson(Map<String, dynamic> json) =>
      _$BookListVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookListVOToJson(this);

  @override
  String toString() {
    return 'BookListVO(listId: $listId, listName: $listName, listNameEncoded: $listNameEncoded, displayName: $displayName, updated: $updated, listImage: $listImage, listImageWidth: $listImageWidth, listImageHeight: $listImageHeight, booksList: $booksList, bestSellerDate: $bestSellerDate, publishedDate: $publishedDate, rank: $rank, rankLastWeek: $rankLastWeek, weeksOnList: $weeksOnList, asterisk: $asterisk, dagger: $dagger, amazonProductUrl: $amazonProductUrl, isbns: $isbns, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookListVO &&
        other.listId == listId &&
        other.listName == listName &&
        other.listNameEncoded == listNameEncoded &&
        other.displayName == displayName &&
        other.updated == updated &&
        other.listImage == listImage &&
        other.listImageWidth == listImageWidth &&
        other.listImageHeight == listImageHeight &&
        listEquals(other.booksList, booksList) &&
        other.bestSellerDate == bestSellerDate &&
        other.publishedDate == publishedDate &&
        other.rank == rank &&
        other.rankLastWeek == rankLastWeek &&
        other.weeksOnList == weeksOnList &&
        other.asterisk == asterisk &&
        other.dagger == dagger &&
        other.amazonProductUrl == amazonProductUrl &&
        listEquals(other.isbns, isbns) &&
        listEquals(other.details, details);
  }

  @override
  int get hashCode {
    return listId.hashCode ^
        listName.hashCode ^
        listNameEncoded.hashCode ^
        displayName.hashCode ^
        updated.hashCode ^
        listImage.hashCode ^
        listImageWidth.hashCode ^
        listImageHeight.hashCode ^
        booksList.hashCode ^
        bestSellerDate.hashCode ^
        publishedDate.hashCode ^
        rank.hashCode ^
        rankLastWeek.hashCode ^
        weeksOnList.hashCode ^
        asterisk.hashCode ^
        dagger.hashCode ^
        amazonProductUrl.hashCode ^
        isbns.hashCode ^
        details.hashCode;
  }
}
