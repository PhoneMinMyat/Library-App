import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:library_app/data/vos/buy_link_vo.dart';
import 'package:library_app/persistence/hive_constants.dart';

part 'book_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_BOOK_VO, adapterName: 'BookVOAdapter')
class BookVO {
  @JsonKey(name: 'age_group')
  @HiveField(0)
  String? ageGroup;

  @JsonKey(name: 'amazon_product_url')
  @HiveField(1)
  String? amazonProuctUrl;

  @JsonKey(name: 'article_chapter_link')
  @HiveField(2)
  String? articleChapterLink;

  @JsonKey(name: 'author')
  @HiveField(3)
  String? author;

  @JsonKey(name: 'book_image')
  @HiveField(4)
  String? bookImage;

  @JsonKey(name: 'book_image_width')
  @HiveField(5)
  double? bookImageWidth;

  @JsonKey(name: 'book_image_height')
  @HiveField(6)
  double? bookImageHeight;

  @JsonKey(name: 'book_review_link')
  @HiveField(7)
  String? bookReviewLink;

  @JsonKey(name: 'contributor')
  @HiveField(8)
  String? contributor;

  @JsonKey(name: 'contributor_note')
  @HiveField(9)
  String? contributorNote;

  @JsonKey(name: 'created_date')
  @HiveField(10)
  String? createdDate;

  @JsonKey(name: 'description')
  @HiveField(11)
  String? description;

  @JsonKey(name: 'first_chapter_link')
  @HiveField(12)
  String? firstChapterLink;

  @JsonKey(name: 'price')
  @HiveField(13)
  String? price;

  @JsonKey(name: 'primary_isbn10')
  @HiveField(14)
  String? primaryIsbn10;

  @JsonKey(name: 'primary_isbn13')
  @HiveField(15)
  String? primaryIsbn13;

  @JsonKey(name: 'book_uri')
  @HiveField(16)
  String? bookUri;

  @JsonKey(name: 'publisher')
  @HiveField(17)
  String? publisher;

  @JsonKey(name: 'rank')
  @HiveField(18)
  int? rank;

  @JsonKey(name: 'rank_last_week')
  @HiveField(19)
  int? rankLastWeek;

  @JsonKey(name: 'sunday_review_link')
  @HiveField(20)
  String? sundayReviewLink;

  @JsonKey(name: 'title')
  @HiveField(21)
  String? title;

  @JsonKey(name: 'updated_date')
  @HiveField(22)
  String? updatedDate;

  @JsonKey(name: 'weeks_on_list')
  @HiveField(23)
  int? weeksOnList;

  @JsonKey(name: 'buy_links')
  @HiveField(24)
  List<BuyLinkVO>? buyLinks;

  @HiveField(25)
  String? userViewedTime;

  @HiveField(26)
  String? category;
  BookVO({
    this.ageGroup,
    this.amazonProuctUrl,
    this.articleChapterLink,
    this.author,
    this.bookImage,
    this.bookImageWidth,
    this.bookImageHeight,
    this.bookReviewLink,
    this.contributor,
    this.contributorNote,
    this.createdDate,
    this.description,
    this.firstChapterLink,
    this.price,
    this.primaryIsbn10,
    this.primaryIsbn13,
    this.bookUri,
    this.publisher,
    this.rank,
    this.rankLastWeek,
    this.sundayReviewLink,
    this.title,
    this.updatedDate,
    this.weeksOnList,
    this.buyLinks,
    this.userViewedTime,
    this.category,
  });

  

 

  factory BookVO.fromJson(Map<String, dynamic> json) => _$BookVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookVOToJson(this);


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BookVO &&
      other.ageGroup == ageGroup &&
      other.amazonProuctUrl == amazonProuctUrl &&
      other.articleChapterLink == articleChapterLink &&
      other.author == author &&
      other.bookImage == bookImage &&
      other.bookImageWidth == bookImageWidth &&
      other.bookImageHeight == bookImageHeight &&
      other.bookReviewLink == bookReviewLink &&
      other.contributor == contributor &&
      other.contributorNote == contributorNote &&
      other.createdDate == createdDate &&
      other.description == description &&
      other.firstChapterLink == firstChapterLink &&
      other.price == price &&
      other.primaryIsbn10 == primaryIsbn10 &&
      other.primaryIsbn13 == primaryIsbn13 &&
      other.bookUri == bookUri &&
      other.publisher == publisher &&
      other.rank == rank &&
      other.rankLastWeek == rankLastWeek &&
      other.sundayReviewLink == sundayReviewLink &&
      other.title == title &&
      other.updatedDate == updatedDate &&
      other.weeksOnList == weeksOnList &&
      listEquals(other.buyLinks, buyLinks) &&
      other.userViewedTime == userViewedTime &&
      other.category == category;
  }

  @override
  int get hashCode {
    return ageGroup.hashCode ^
      amazonProuctUrl.hashCode ^
      articleChapterLink.hashCode ^
      author.hashCode ^
      bookImage.hashCode ^
      bookImageWidth.hashCode ^
      bookImageHeight.hashCode ^
      bookReviewLink.hashCode ^
      contributor.hashCode ^
      contributorNote.hashCode ^
      createdDate.hashCode ^
      description.hashCode ^
      firstChapterLink.hashCode ^
      price.hashCode ^
      primaryIsbn10.hashCode ^
      primaryIsbn13.hashCode ^
      bookUri.hashCode ^
      publisher.hashCode ^
      rank.hashCode ^
      rankLastWeek.hashCode ^
      sundayReviewLink.hashCode ^
      title.hashCode ^
      updatedDate.hashCode ^
      weeksOnList.hashCode ^
      buyLinks.hashCode ^
      userViewedTime.hashCode ^
      category.hashCode;
  }

  @override
  String toString() {
    return 'BookVO(ageGroup: $ageGroup, amazonProuctUrl: $amazonProuctUrl, articleChapterLink: $articleChapterLink, author: $author, bookImage: $bookImage, bookImageWidth: $bookImageWidth, bookImageHeight: $bookImageHeight, bookReviewLink: $bookReviewLink, contributor: $contributor, contributorNote: $contributorNote, createdDate: $createdDate, description: $description, firstChapterLink: $firstChapterLink, price: $price, primaryIsbn10: $primaryIsbn10, primaryIsbn13: $primaryIsbn13, bookUri: $bookUri, publisher: $publisher, rank: $rank, rankLastWeek: $rankLastWeek, sundayReviewLink: $sundayReviewLink, title: $title, updatedDate: $updatedDate, weeksOnList: $weeksOnList, buyLinks: $buyLinks, userViewedTime: $userViewedTime, category: $category)';
  }
}
