import 'package:library_app/data/models/ny_times_model.dart';
import 'package:library_app/data/vos/shelf_vo.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/book_list_vo.dart';

import '../../mock_data/mock_data.dart';

class NyTimesModelImplMock extends NyTimesModel {
  @override
  void addBookToShelf(int shelfId, String bookId) {
    // No Need
  }

  @override
  void deleteShelf(int shelfId) {
    // No Need
  }

  @override
  void deleteViewBook(String bookID) {
    // No Need
  }

  @override
  Stream<List<BookVO>?> filterBookListByCategory(List<String> categoryList) {
    if (categoryList.isEmpty) {
      return Stream.value(getMockBookList());
    } else {
      return Stream.value([getMockBookList()?.first ?? BookVO()]);
    }
  }

  @override
  Future<List<BookVO>?> getBookCategoryListDetails(String list, String offset) {
    return Future.value(getMockBookList());
  }

  @override
  Stream<List<BookVO>?> getBooksByCategoryFromDatabase(String category) {
    return Stream.value(getMockBookList());
  }

  @override
  void getOverviewBookList() {
    // No Need
  }

  @override
  Stream<List<BookListVO>?> getOverviewBookListFromDatabase() {
    return Stream.value(getMockBookCollectionList());
  }

  @override
  Stream<ShelfVO?> getShelfById(int shelfId) {
    return Stream.value(getMockShelfList()?.first);
  }

  @override
  Stream<List<ShelfVO>?> getShelfListFromDatabase() {
    return Stream.value(getMockShelfList());
  }

  @override
  Stream<BookVO?> getSingleBookFromDatabase(String bookId) {
    return Stream.value(getMockBookList()?.first);
  }

  @override
  Stream<List<BookVO>> getViewedBookListFromDatabase() {
    return Stream.value(getMockBookList() ?? []);
  }

  @override
  void removeBookFromShelf(int shelfId, String bookId) {
    // No Need
  }

  @override
  void renameShelf(int shelfId, String rename) {
    // No Need
  }

  @override
  void saveShelf(String shelfName, [BookVO? selectedBook]) {
    // No Need
  }

  @override
  void saveViewedBook(BookVO viewedBook) {
    // No Need
  }
}
