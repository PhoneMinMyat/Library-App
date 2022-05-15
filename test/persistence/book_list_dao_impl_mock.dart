import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/persistence/daos/book_list_dao.dart';

import '../mock_data/mock_data.dart';

class BookListDaoImplMock extends BookListDao {
  Map<int, BookListVO> bookListFromDatabaseMock = {};

  @override
  List<BookListVO> getAllBookList() {
    return getMockBookCollectionList() ?? [];
  }

  @override
  Stream<void> getBookListEventStream() {
    return Stream.value(null);
  }

  @override
  Stream<List<BookListVO>> getBookListStream() {
    return Stream.value(getMockBookCollectionList() ?? []);
  }

  @override
  void saveAllBookListDao(List<BookListVO> bookListList) {
    bookListList.forEach((bookList) {
      bookListFromDatabaseMock[bookList.listId ?? 0] = bookList;
    });
  }
}
