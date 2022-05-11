import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/data/vos/book_vo.dart';

abstract class NyTimesModel{
  //Network
  void getOverviewBookList();

  void saveViewedBook(BookVO viewedBook);

  Future<List<BookVO>?> getBookCategoryListDetails(String list, String offset);

 

  //Database
  Stream<List<BookListVO>?> getOverviewBookListFromDatabase();

  Stream<List<BookVO>> getViewedBookListFromDatabase();

  Stream<BookVO?> getSingleBookFromDatabase(String bookId);

  Stream<List<BookVO>?> getBooksByCategoryFromDatabase(String category);

   Stream<List<BookVO>?> filterBookListByCategory(List<String> categoryList);
}