import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/shelf_vo.dart';

abstract class NyTimesModel {
  //Network
  void getOverviewBookList();

  void saveViewedBook(BookVO viewedBook);

  void deleteViewBook(String bookID);

  Future<List<BookVO>?> getBookCategoryListDetails(String list, String offset);

  void saveShelf(String shelfName,[BookVO? selectedBook]);

  void deleteShelf(int shelfId);

  void addBookToShelf(int shelfId, String bookId);

  void renameShelf(int shelfId, String rename);

  void removeBookFromShelf(int shelfId ,String bookId);

  //Database
  Stream<List<BookListVO>?> getOverviewBookListFromDatabase();

  Stream<List<BookVO>> getViewedBookListFromDatabase();

  Stream<BookVO?> getSingleBookFromDatabase(String bookId);

  Stream<List<BookVO>?> getBooksByCategoryFromDatabase(String category);

  Stream<List<BookVO>?> filterBookListByCategory(List<String> categoryList);

  Stream<List<ShelfVO>?> getShelfListFromDatabase();

  Stream<ShelfVO?> getShelfById(int shelfId);
}
