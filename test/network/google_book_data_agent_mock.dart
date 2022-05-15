import 'package:library_app/data/vos/google_item_vo.dart';
import 'package:library_app/network/data_agents/google_book_data_agent.dart';

import '../mock_data/mock_data.dart';

class GoogleBookDataAgentMock extends GoogleBookDataAgent {
  @override
  Future<List<GoogleItemVO>?> getGoogleBookItem(String searchKey) {
    return Future.value(getMockGoogleItemVO());
  }
}
