import 'package:library_app/data/vos/book_list_vo.dart';

abstract class BookListDao{
  void saveAllBookListDao(List<BookListVO> bookListList);

  List<BookListVO> getAllBookList();


  //Reactive
  Stream<void> getBookListEventStream();

  Stream<List<BookListVO>> getBookListStream();
  
}