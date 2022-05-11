import 'package:dio/dio.dart';
import 'package:library_app/data/vos/google_item_vo.dart';
import 'package:library_app/network/data_agents/google_book_data_agent.dart';
import 'package:library_app/network/google_book_api.dart';

class RetrofitGoogleBookDataAgentImpl extends GoogleBookDataAgent {
  late GoogleBookApi _mApi;

  static final RetrofitGoogleBookDataAgentImpl _singleton =
      RetrofitGoogleBookDataAgentImpl._internal();

  factory RetrofitGoogleBookDataAgentImpl() {
    return _singleton;
  }

  RetrofitGoogleBookDataAgentImpl._internal() {
    final dio = Dio();
    _mApi = GoogleBookApi(dio);
  }

  @override
  Future<List<GoogleItemVO>?> getGoogleBookItem(String searchKey) {
   return _mApi
        .getGoogleBookApi(searchKey)
        .asStream().map((response) => response.items).first;
  }
}
