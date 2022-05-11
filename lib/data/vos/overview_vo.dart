import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/persistence/hive_constants.dart';

part 'overview_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_OVERVIEW_VO, adapterName: 'OverviewVOAdapter')
class OverviewVO {
  @JsonKey(name: 'bestsellers_date')
  @HiveField(0)
  String? bestSellerDate;

  @JsonKey(name: 'published_date')
  @HiveField(1)
  String? publishedDate;

  @JsonKey(name: 'published_date_description')
  @HiveField(2)
  String? publishedDateDescription;

  @JsonKey(name: 'previous_published_date')
  @HiveField(3)
  String? previousPublishedDate;

  @JsonKey(name: 'next_published_date')
  @HiveField(4)
  String? nextPublishedDate;

  @JsonKey(name: 'lists')
  @HiveField(5)
  List<BookListVO>? bookListsList;
  OverviewVO({
    this.bestSellerDate,
    this.publishedDate,
    this.publishedDateDescription,
    this.previousPublishedDate,
    this.nextPublishedDate,
    this.bookListsList,
  });

  factory OverviewVO.fromJson(Map<String, dynamic> json) =>
      _$OverviewVOFromJson(json);

  Map<String, dynamic> toJson() => _$OverviewVOToJson(this);

  @override
  String toString() {
    return 'OverviewVO(bestSellerDate: $bestSellerDate, publishedDate: $publishedDate, publishedDateDescription: $publishedDateDescription, previousPublishedDate: $previousPublishedDate, nextPublishedDate: $nextPublishedDate, bookListsList: $bookListsList)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OverviewVO &&
        other.bestSellerDate == bestSellerDate &&
        other.publishedDate == publishedDate &&
        other.publishedDateDescription == publishedDateDescription &&
        other.previousPublishedDate == previousPublishedDate &&
        other.nextPublishedDate == nextPublishedDate &&
        listEquals(other.bookListsList, bookListsList);
  }

  @override
  int get hashCode {
    return bestSellerDate.hashCode ^
        publishedDate.hashCode ^
        publishedDateDescription.hashCode ^
        previousPublishedDate.hashCode ^
        nextPublishedDate.hashCode ^
        bookListsList.hashCode;
  }
}
