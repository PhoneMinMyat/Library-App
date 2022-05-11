import 'package:hive/hive.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/persistence/daos/all_book_dao.dart';
import 'package:library_app/persistence/hive_constants.dart';

class AllBookDaoImpl extends AllBookDao {
  @override
  void saveAllBook(List<BookVO> bookList,[ String? category]) async {
    Map<String, BookVO> bookMap = Map.fromIterable(
      bookList,
      key: (element) => element.primaryIsbn10,
      value: (element) {
        BookVO tempBookVo = element;
        if (category != null) {
          tempBookVo.category = category;
        }
        return tempBookVo;
      },
    );

    await getAllBookBox().putAll(bookMap);
  }

  @override
  void saveSingleBook(BookVO book) async {
    await getAllBookBox().put(book.primaryIsbn10, book);
  }

  @override
  List<BookVO> getAllBooks() {
    return getAllBookBox().values.toList();
  }

  @override
  BookVO? getSingleBook(String id) {
    if (getAllBookBox().get(id)?.title != null) {
      return getAllBookBox().get(id);
    } else {
      return BookVO();
    }
  }

  @override
  List<BookVO>? getSearchBooksByCategory(String category) {
    if(getAllBooks().isNotEmpty){
      return getAllBooks().where((book) => book.category == category).toList();
    }else{
      return [];
    }
  }

  @override
  Stream<void> getAllBookEventStream() {
    return getAllBookBox().watch();
  }

  @override
  Stream<List<BookVO>> getAllBooktream() {
    return Stream.value(getAllBooks());
  }

  Box<BookVO> getAllBookBox() {
    return Hive.box<BookVO>(BOX_NAME_ALL_BOOK_VO);
  }

  @override
  Stream<BookVO> getSingleBookStream(String bookId) {
    return Stream.value(getSingleBook(bookId) ?? BookVO());
  }

  @override
  Stream<List<BookVO>> getSearchBooksByCategoryStream(String category) {
    return Stream.value(getSearchBooksByCategory(category) ?? []);
  }
}
