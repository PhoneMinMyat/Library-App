import 'package:library_app/data/vos/book_vo.dart';

abstract class ViewedBookDao{
  void saveViewedBook(BookVO viewedBook);

  void deleteViewedBook(String bookId);

  List<BookVO> getAllViewedBooks();

  BookVO? getBookByIdFromDatabase(String id);

  List<BookVO> filterBookByCategory(List<String> categoryList);
  //Reactive
  Stream<void> getAllViewedBookEventStream();

  Stream<List<BookVO>> getAllViewedBookStream();

  Stream<List<BookVO>> filterBookByCategoryStream(List<String> categoryList);
}