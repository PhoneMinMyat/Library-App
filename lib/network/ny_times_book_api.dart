import 'package:dio/dio.dart';
import 'package:library_app/network/api_constants.dart';
import 'package:library_app/network/responses/get_list_responses.dart';
import 'package:library_app/network/responses/get_overview_response.dart';
import 'package:retrofit/http.dart';

part 'ny_times_book_api.g.dart';


@RestApi(baseUrl: BASE_NEWYORK_TIME_URL_DIO)
abstract class NyTimesBookApi{
  factory NyTimesBookApi(Dio dio) = _NyTimesBookApi;
  

  @GET(ENDPOINTS_GET_OVERVIEW)
  Future<GetOverviewResponse> getOverviewBookData(
    @Query(PARAM_API_KEY) String apiKey
  );

   @GET(ENDPOINTS_GET_LIST)
  Future<GetListResponse> getListData(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LIST) String list,
    @Query(PARAM_OFFSET) String offset, 
  );
}