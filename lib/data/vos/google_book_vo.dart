import 'package:json_annotation/json_annotation.dart';

import 'package:library_app/data/vos/google_idustry_identifiers_vo.dart';
import 'package:library_app/data/vos/google_image_links_vo.dart';
import 'package:library_app/data/vos/google_reading_modes_vo.dart';

part 'google_book_vo.g.dart';

@JsonSerializable()
class GoogleBookVO {
  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'subtitle')
  String? subtitle;

  @JsonKey(name: 'authors')
  List<String>? authors;

  @JsonKey(name: 'publisher')
  String? publisher;

  @JsonKey(name: 'publishedDate')
  String? publishedDate;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'industryIdentifiers')
  List<GoogleIdustryIdentifiersVO>? industryIdentifiers;

  @JsonKey(name: 'readingModes')
  ReadingModesVO? readingModes;

  @JsonKey(name: 'pageCount')
  int? pageCount;

  @JsonKey(name: 'printType')
  String? printType;

  @JsonKey(name: 'categories')
  List<String>? categories;

  @JsonKey(name: 'averageRating')
  double? averageRating;

  @JsonKey(name: 'ratingsCount')
  int? ratingCount;

  @JsonKey(name: 'maturityRating')
  String? maturityRating;

  @JsonKey(name: 'allowAnonLogging')
  bool? allowAnnonLogging;

  @JsonKey(name: 'contentVersion')
  String? contentVersion;

  @JsonKey(name: 'imageLinks')
  GoogleImageLinksVO? imageLinks;

  @JsonKey(name: 'language')
  String? language;

  @JsonKey(name: 'previewLink')
  String? previewLink;

  @JsonKey(name: 'infoLink')
  String? infoLink;

  @JsonKey(name: 'canonicalVolumeLink')
  String? canonicalVolumeLink;

  
  GoogleBookVO({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingCount,
    this.maturityRating,
    this.allowAnnonLogging,
    this.contentVersion,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory GoogleBookVO.fromJson(Map<String, dynamic> json) =>
      _$GoogleBookVOFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleBookVOToJson(this);

  String? getAuthorsAsCommaSperatedString(){
    if(authors != null){
      return authors?.join(',');
    }else{
      return null;
    }
  }

  String? getCategoriesAsCommaSeperatdString(){
    if(categories != null){
      return categories?.join(',');
    }else{
      return null;
    }
  }
}
