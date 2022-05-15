import 'package:library_app/data/vos/shelf_vo.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/persistence/daos/shelf_dao.dart';

import '../mock_data/mock_data.dart';

class ShelfDaoImplMock extends ShelfDao {
  Map<int, ShelfVO> shelfListFromDatabaseMock = {};
  @override
  void addBookToShelf(int shelfId, BookVO book) {
    shelfListFromDatabaseMock[shelfId]?.bookList?.add(book);
  }

  @override
  void deleteShelf(int shelfId) {
    shelfListFromDatabaseMock.removeWhere((key, value) => key == shelfId);
  }

  @override
  Stream<void> getAllShelvesEventStream() {
    return Stream.value(null);
  }

  @override
  List<ShelfVO> getAllShelvesFromDatabase() {
    return getMockShelfList() ?? [];
  }

  @override
  Stream<List<ShelfVO>> getAllShelvesFromDatabaseStream() {
   return Stream.value(getMockShelfList() ?? []);
  }

  @override
  List<BookVO> getBooksFromShelves(int shelfId) {
    return getMockShelfList()?.first.bookList ?? [];
  }

  @override
  Stream<List<BookVO>> getBooksFromShelvesStream(int shelfId) {
    return Stream.value(getBooksFromShelves(shelfId));
  }

  @override
  Stream<ShelfVO> getShelfByShelfIdStream(int shelfId) {
    return Stream.value(getSingleShelfFromDatabase(shelfId));
  }

  @override
  ShelfVO getSingleShelfFromDatabase(int shelfId) {
   return getMockShelfList()?.first ?? ShelfVO();
  }

  @override
  void removeBookFromShelf(int shelfId, String bookId) {
    shelfListFromDatabaseMock[shelfId]?.bookList?.removeWhere((element) => element.primaryIsbn10 == bookId);
  }

  @override
  void renameShelf(String shelfName, int shelfId) {
    shelfListFromDatabaseMock[shelfId]?.name = shelfName;
  }

  @override
  void saveShelf(String shelfName, [BookVO? selectedBook]) {
    String idAsString = DateTime.now().millisecond.toString() +
        DateTime.now().microsecond.toString();
    int id = int.parse(idAsString);
    shelfListFromDatabaseMock[id] = ShelfVO(id: id, name: shelfName);
  }
}
