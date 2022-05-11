// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_overview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOverviewResponse _$GetOverviewResponseFromJson(Map<String, dynamic> json) =>
    GetOverviewResponse(
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      numResults: json['num_results'] as int?,
      results: json['results'] == null
          ? null
          : OverviewVO.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetOverviewResponseToJson(
        GetOverviewResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'results': instance.results,
    };
