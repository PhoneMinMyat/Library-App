// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_book_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GoogleBookApi implements GoogleBookApi {
  _GoogleBookApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com/books/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GoogleBookApiResponse> getGoogleBookApi(searchKey) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': searchKey};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GoogleBookApiResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/volumes',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GoogleBookApiResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
