import 'package:hive/hive.dart';
import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/persistence/daos/book_list_dao.dart';
import 'package:library_app/persistence/hive_constants.dart';

class BookListDaoImpl extends BookListDao {
  static final BookListDaoImpl _singleton = BookListDaoImpl._internal();

  factory BookListDaoImpl() {
    return _singleton;
  }

  BookListDaoImpl._internal();
  @override
  List<BookListVO> getAllBookList() {
    return getBookListBox().values.toList();
  }

  @override
  void saveAllBookListDao(List<BookListVO> bookListList) async {
    Map<int, BookListVO> bookListMap = Map.fromIterable(
      bookListList,
      key: (bookList) => bookList.listId,
      value: (bookList) => bookList,
    );

    await getBookListBox().putAll(bookListMap);
  }

  //Reactive

  @override
  Stream<void> getBookListEventStream() {
    return getBookListBox().watch();
  }

  @override
  Stream<List<BookListVO>> getBookListStream() {
    return Stream.value(getAllBookList());
  }

  Box<BookListVO> getBookListBox() {
    return Hive.box<BookListVO>(BOX_NAME_BOOK_LIST_VO);
  }
}
