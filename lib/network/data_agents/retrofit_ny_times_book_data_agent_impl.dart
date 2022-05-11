import 'package:dio/dio.dart';
import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/data/vos/overview_vo.dart';
import 'package:library_app/network/api_constants.dart';
import 'package:library_app/network/data_agents/ny_times_book_data_agent.dart';
import 'package:library_app/network/ny_times_book_api.dart';

class RetrofitNyTimesDataAgentImpl extends NyTimesBookDataAgent {
  late NyTimesBookApi _mApi;

  static final RetrofitNyTimesDataAgentImpl _singleton =
      RetrofitNyTimesDataAgentImpl._internal();

  factory RetrofitNyTimesDataAgentImpl() {
    return _singleton;
  }

  RetrofitNyTimesDataAgentImpl._internal() {
    final dio = Dio();
    _mApi = NyTimesBookApi(dio);
  }

  @override
  Future<OverviewVO?> getOverviewBookList() {
    return _mApi.getOverviewBookData(API_KEY).asStream().map((response) {
      return response.results;
    }).first;
  }

  @override
  Future<List<BookListVO>?> getListBookList(String list, String pageOffset) {
    return _mApi
        .getListData(API_KEY, list, pageOffset)
        .asStream()
        .map((response) => response.results)
        .first;
  }
}
