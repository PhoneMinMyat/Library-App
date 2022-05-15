import 'package:library_app/data/vos/overview_vo.dart';
import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/network/data_agents/ny_times_book_data_agent.dart';

import '../mock_data/mock_data.dart';

class NyTimesBookDataAgentMock extends NyTimesBookDataAgent{
  @override
  Future<List<BookListVO>?> getListBookList(String list, String pageOffset) {
    return Future.value(getMockBookCollectionList());
  }

  @override
  Future<OverviewVO?> getOverviewBookList() {
    return Future.value(getMockOverview());
  }


}