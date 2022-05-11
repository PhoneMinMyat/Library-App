// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListResponse _$GetListResponseFromJson(Map<String, dynamic> json) =>
    GetListResponse(
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      numResults: json['num_results'] as int?,
      lastModified: json['last_modified'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => BookListVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetListResponseToJson(GetListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'last_modified': instance.lastModified,
      'results': instance.results,
    };
