import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/persistence/daos/all_book_dao.dart';

import '../mock_data/mock_data.dart';

class AllBookDaoImplMock extends AllBookDao {
  Map<String, BookVO> allBookListFromDataBaseMock = {};
  @override
  Stream<void> getAllBookEventStream() {
    return Stream.value(null);
  }

  @override
  List<BookVO> getAllBooks() {
    return getMockBookList() ?? [];
  }

  @override
  Stream<List<BookVO>> getAllBooktream() {
    return Stream.value(getMockBookList() ?? []);
  }

  @override
  List<BookVO>? getSearchBooksByCategory(String category) {
    return getMockBookList();
  }

  @override
  Stream<List<BookVO>> getSearchBooksByCategoryStream(String category) {
    return Stream.value(getMockBookList() ?? []);
  }

  @override
  BookVO? getSingleBook(String id) {
    return getMockBookList()?.first;
  }

  @override
  Stream<BookVO> getSingleBookStream(String bookId) {
    return Stream.value(getMockBookList()?.first ?? BookVO());
  }

  @override
  void saveAllBook(List<BookVO> bookList, [String? category]) {
    bookList.forEach((book) {
      allBookListFromDataBaseMock[book.primaryIsbn10 ?? ''] = book;
    });
  }

  @override
  void saveSingleBook(BookVO book) {
    allBookListFromDataBaseMock[book.primaryIsbn10 ?? ''] = book;
  }
}
