import 'package:dio/dio.dart';
import 'package:library_app/network/api_constants.dart';
import 'package:library_app/network/responses/get_google_api_responses.dart';
import 'package:retrofit/http.dart';

part 'google_book_api.g.dart';

@RestApi(baseUrl: BASE_GOOGLE_BOOK_API_URL_DIO)
abstract class GoogleBookApi {
  factory GoogleBookApi(Dio dio) = _GoogleBookApi;

  @GET(ENDPOINTS_GET_GOOGLE_BOOK_API)
  Future<GoogleBookApiResponse> getGoogleBookApi(
    @Query(PARAM_Q) String searchKey,
  );
}
