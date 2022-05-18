import 'package:library_app/data/models/google_book_model.dart';
import 'package:library_app/data/vos/google_item_vo.dart';
import 'package:library_app/data/vos/book_vo.dart';

import '../../mock_data/mock_data.dart';

class GoogleModelImplMock extends GoogleBookModel {
  @override
  List<BookVO> convertGoogleBookVOToBookVO(List<GoogleItemVO> googleBookList) {
    return getMockBookList() ?? [];
  }

  @override
  Future<List<BookVO>?> getSearchResultBookList(String searchKey) {
    return Future.value(getMockBookList());
  }
}
