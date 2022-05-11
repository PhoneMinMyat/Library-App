
import 'package:json_annotation/json_annotation.dart';

import 'package:library_app/data/vos/overview_vo.dart';

part 'get_overview_response.g.dart';

@JsonSerializable()
class GetOverviewResponse {

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'copyright')
  String? copyright;

  @JsonKey(name: 'num_results')
  int? numResults;

  @JsonKey(name: 'results')
  OverviewVO? results;

  
  GetOverviewResponse({
    this.status,
    this.copyright,
    this.numResults,
    this.results,
  });

  factory GetOverviewResponse.fromJson(Map<String, dynamic> json) => _$GetOverviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOverviewResponseToJson(this);

  @override
  String toString() {
    return 'GetOverviewResponse(status: $status, copyright: $copyright, numResults: $numResults, results: $results)';
  }
}
