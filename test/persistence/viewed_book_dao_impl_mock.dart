import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/persistence/daos/viewed_book_dao.dart';

import '../mock_data/mock_data.dart';

class ViewedBookDaoImplMock extends ViewedBookDao {
  Map<String, BookVO> viewedBookFromDatabaseMock = {};

  @override
  void deleteViewedBook(String bookId) {
    viewedBookFromDatabaseMock.remove(bookId);
  }

  @override
  List<BookVO> filterBookByCategory(List<String> categoryList) {
    if (categoryList.isEmpty) {
      return getMockBookList() ?? [];
    }else{
      return [getMockBookList()?.first ?? BookVO()];
    }
  }

  @override
  Stream<List<BookVO>> filterBookByCategoryStream(List<String> categoryList) {
    return Stream.value(filterBookByCategory(categoryList));
  }

  @override
  Stream<void> getAllViewedBookEventStream() {
    return Stream.value(null);
  }

  @override
  Stream<List<BookVO>> getAllViewedBookStream() {
    return Stream.value(getAllViewedBooks());
  }

  @override
  List<BookVO> getAllViewedBooks() {
    return getMockBookList() ?? [];
  }

  @override
  BookVO? getBookByIdFromDatabase(String id) {
    return getMockBookList()?.first;
  }

  @override
  void saveViewedBook(BookVO viewedBook) {
    viewedBookFromDatabaseMock[viewedBook.primaryIsbn10 ?? ''] = viewedBook;
  }
}
