import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:library_app/data/vos/book_list_vo.dart';

part 'get_list_responses.g.dart';

@JsonSerializable()
class GetListResponse {
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'copyright')
  String? copyright;

  @JsonKey(name: 'num_results')
  int? numResults;

  @JsonKey(name: 'last_modified')
  String? lastModified;

  @JsonKey(name: 'results')
  List<BookListVO>? results;


  GetListResponse({
    this.status,
    this.copyright,
    this.numResults,
    this.lastModified,
    this.results,
  });

  factory GetListResponse.fromJson(Map<String, dynamic> json) => _$GetListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetListResponseToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GetListResponse &&
      other.status == status &&
      other.copyright == copyright &&
      other.numResults == numResults &&
      other.lastModified == lastModified &&
      listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return status.hashCode ^
      copyright.hashCode ^
      numResults.hashCode ^
      lastModified.hashCode ^
      results.hashCode;
  }

  @override
  String toString() {
    return 'GetListResponse(status: $status, copyright: $copyright, numResults: $numResults, lastModified: $lastModified, results: $results)';
  }
}
