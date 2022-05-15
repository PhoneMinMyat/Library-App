import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/shelf_vo.dart';

abstract class ShelfDao {
  void saveShelf(String shelfName, [BookVO? selectedBook]);

  void deleteShelf(int shelfId);

  void addBookToShelf(int shelfId, BookVO book);

  void removeBookFromShelf(int shelfId, String bookId);

  void renameShelf(String shelfName, int shelfId);

  ShelfVO getSingleShelfFromDatabase(int shelfId);

  List<ShelfVO> getAllShelvesFromDatabase();

  List<BookVO> getBooksFromShelves(int shelfId);

  Stream<void> getAllShelvesEventStream();

  Stream<List<ShelfVO>> getAllShelvesFromDatabaseStream();

  Stream<List<BookVO>> getBooksFromShelvesStream(int shelfId);
  Stream<ShelfVO> getShelfByShelfIdStream(int shelfId);
}
