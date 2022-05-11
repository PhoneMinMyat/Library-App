import 'package:library_app/data/vos/book_vo.dart';

abstract class ViewedBookDao{
  void saveViewedBook(BookVO viewedBook);

  List<BookVO> getAllViewedBooks();

  BookVO? getBookByIdFromDatabase(int id);

  List<BookVO> filterBookByCategory(List<String> categoryList);
  //Reactive
  Stream<void> getAllViewedBookEventStream();

  Stream<List<BookVO>> getAllViewedBookStream();

  Stream<List<BookVO>> filterBookByCategoryStream(List<String> categoryList);
}