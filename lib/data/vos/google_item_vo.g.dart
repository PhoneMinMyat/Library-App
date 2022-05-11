// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_item_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleItemVO _$GoogleItemVOFromJson(Map<String, dynamic> json) => GoogleItemVO(
      kind: json['kind'] as String?,
      id: json['id'] as String?,
      etag: json['etag'] as String?,
      selfLink: json['selfLink'] as String?,
      volumeInfo: json['volumeInfo'] == null
          ? null
          : GoogleBookVO.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      searchInfo: json['searchInfo'] == null
          ? null
          : GoogleSearchInfoVO.fromJson(
              json['searchInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoogleItemVOToJson(GoogleItemVO instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'etag': instance.etag,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo,
      'searchInfo': instance.searchInfo,
    };
