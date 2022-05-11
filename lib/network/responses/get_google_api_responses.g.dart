// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_google_api_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleBookApiResponse _$GoogleBookApiResponseFromJson(
        Map<String, dynamic> json) =>
    GoogleBookApiResponse(
      kind: json['kind'] as String?,
      totalItems: json['totalItems'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => GoogleItemVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoogleBookApiResponseToJson(
        GoogleBookApiResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items,
    };
