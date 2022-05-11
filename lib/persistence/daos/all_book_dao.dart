import 'package:library_app/data/vos/book_vo.dart';

abstract class AllBookDao{
  void saveAllBook(List<BookVO> bookList,[ String? category]);

  void saveSingleBook(BookVO book);

  List<BookVO> getAllBooks();

  BookVO? getSingleBook(String id);

  List<BookVO>? getSearchBooksByCategory(String category);
  //Reactive
  Stream<void> getAllBookEventStream();

  Stream<List<BookVO>> getAllBooktream();

  Stream<BookVO> getSingleBookStream(String bookId);

  Stream<List<BookVO>> getSearchBooksByCategoryStream(String category);
}