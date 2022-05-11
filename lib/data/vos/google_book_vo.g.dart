// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_book_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleBookVO _$GoogleBookVOFromJson(Map<String, dynamic> json) => GoogleBookVO(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publisher: json['publisher'] as String?,
      publishedDate: json['publishedDate'] as String?,
      description: json['description'] as String?,
      industryIdentifiers: (json['industryIdentifiers'] as List<dynamic>?)
          ?.map((e) =>
              GoogleIdustryIdentifiersVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      readingModes: json['readingModes'] == null
          ? null
          : ReadingModesVO.fromJson(
              json['readingModes'] as Map<String, dynamic>),
      pageCount: json['pageCount'] as int?,
      printType: json['printType'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      ratingCount: json['ratingsCount'] as int?,
      maturityRating: json['maturityRating'] as String?,
      allowAnnonLogging: json['allowAnonLogging'] as bool?,
      contentVersion: json['contentVersion'] as String?,
      imageLinks: json['imageLinks'] == null
          ? null
          : GoogleImageLinksVO.fromJson(
              json['imageLinks'] as Map<String, dynamic>),
      language: json['language'] as String?,
      previewLink: json['previewLink'] as String?,
      infoLink: json['infoLink'] as String?,
      canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
    );

Map<String, dynamic> _$GoogleBookVOToJson(GoogleBookVO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'industryIdentifiers': instance.industryIdentifiers,
      'readingModes': instance.readingModes,
      'pageCount': instance.pageCount,
      'printType': instance.printType,
      'categories': instance.categories,
      'averageRating': instance.averageRating,
      'ratingsCount': instance.ratingCount,
      'maturityRating': instance.maturityRating,
      'allowAnonLogging': instance.allowAnnonLogging,
      'contentVersion': instance.contentVersion,
      'imageLinks': instance.imageLinks,
      'language': instance.language,
      'previewLink': instance.previewLink,
      'infoLink': instance.infoLink,
      'canonicalVolumeLink': instance.canonicalVolumeLink,
    };
