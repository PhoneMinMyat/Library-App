import 'package:hive/hive.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/persistence/daos/viewed_book_dao.dart';
import 'package:library_app/persistence/hive_constants.dart';

class ViewedBookDaoImpl extends ViewedBookDao {
  @override
  void saveViewedBook(BookVO viewedBook) {
    BookVO tempViewedBook = viewedBook;
    tempViewedBook.userViewedTime = DateTime.now().toString();
    print(tempViewedBook.userViewedTime);
    getBookBox().put(tempViewedBook.primaryIsbn10, tempViewedBook);
  }

  @override
  List<BookVO> getAllViewedBooks() {
    return getBookBox().values.toList();
  }

  @override
  BookVO? getBookByIdFromDatabase(int id) {
    return getBookBox().get(id.toString());
  }

  //Reactive

  @override
  Stream<void> getAllViewedBookEventStream() {
    return getBookBox().watch();
  }

  @override
  Stream<List<BookVO>> getAllViewedBookStream() {
    return Stream.value(getAllViewedBooks());
  }

  @override
  List<BookVO> filterBookByCategory(List<String> categoryList) {
    List<BookVO> tempBookList = [];
    if (categoryList.isEmpty) {
      return getAllViewedBooks();
    } else {
      categoryList.forEach((category) {
        List<BookVO> resultBookList = getAllViewedBooks()
            .where((book) => book.category == category)
            .toList();
        tempBookList.addAll(resultBookList);
      });
      return tempBookList;
    }
  }

  @override
  Stream<List<BookVO>> filterBookByCategoryStream(List<String> categoryList) {
    return Stream.value(filterBookByCategory(categoryList));
  }

  Box<BookVO> getBookBox() {
    return Hive.box<BookVO>(BOX_NAME_BOOK_VO);
  }
}
