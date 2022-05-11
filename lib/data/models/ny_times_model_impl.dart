import 'package:library_app/data/models/ny_times_model.dart';
import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/network/data_agents/ny_times_book_data_agent.dart';
import 'package:library_app/network/data_agents/retrofit_ny_times_book_data_agent_impl.dart';
import 'package:library_app/persistence/daos/all_book_dao.dart';
import 'package:library_app/persistence/daos/impls/all_book_dao_impl.dart';
import 'package:library_app/persistence/daos/viewed_book_dao.dart';
import 'package:library_app/persistence/daos/book_list_dao.dart';
import 'package:library_app/persistence/daos/impls/viewed_book_dao_impl.dart';
import 'package:library_app/persistence/daos/impls/book_list_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

class NyTimesModelImpl extends NyTimesModel {
  static final NyTimesModelImpl _singleton = NyTimesModelImpl._internal();

  factory NyTimesModelImpl() {
    return _singleton;
  }

  //Daos
  BookListDao mBookListDao = BookListDaoImpl();
  ViewedBookDao mViewedBookDao = ViewedBookDaoImpl();
  AllBookDao mAllBookDao = AllBookDaoImpl();

  //Network
  final NyTimesBookDataAgent _mDataAgent = RetrofitNyTimesDataAgentImpl();

  NyTimesModelImpl._internal();
  @override
  void getOverviewBookList() {
    _mDataAgent.getOverviewBookList().then((overview) {
      mBookListDao.saveAllBookListDao(overview?.bookListsList ?? []);
      overview?.bookListsList?.forEach((bookList) {
        mAllBookDao.saveAllBook(
            bookList.booksList ?? [], bookList.listName ?? '');
      });
    });
  }

  @override
  void saveViewedBook(BookVO viewedBook) {
    mViewedBookDao.saveViewedBook(viewedBook);
  }

  @override
  Future<List<BookVO>?> getBookCategoryListDetails(String list, String offset) {
    return _mDataAgent.getListBookList(list, offset).then((bookListList) {
      List<BookVO> returnBookList = [];
      bookListList?.forEach((bookList) {
        List<BookVO> tempBookList = bookList.details?.map((book) {
              BookVO tempBook = book;

              if (mAllBookDao.getSingleBook(book.primaryIsbn10 ?? '')?.title !=
                  null) {
                BookVO bookFromDataBase =
                    mAllBookDao.getSingleBook(book.primaryIsbn10 ?? '') ??
                        BookVO();
                tempBook = bookFromDataBase;
              }
              tempBook.category = list;
              return tempBook;
            }).toList() ??
            [];
        returnBookList.addAll(tempBookList);
      });
      mAllBookDao.saveAllBook(returnBookList, list);
      return returnBookList;
    }).catchError((error) => print(error));
  }

  //Reactive

  @override
  Stream<List<BookListVO>?> getOverviewBookListFromDatabase() {
    getOverviewBookList();
    return mBookListDao
        .getBookListEventStream()
        .startWith(mBookListDao.getBookListStream())
        .map((event) => mBookListDao.getAllBookList());
  }

  @override
  Stream<List<BookVO>> getViewedBookListFromDatabase() {
    return mViewedBookDao
        .getAllViewedBookEventStream()
        .startWith(mViewedBookDao.getAllViewedBookStream())
        .map((event) => mViewedBookDao.getAllViewedBooks());
  }

  @override
  Stream<BookVO?> getSingleBookFromDatabase(String bookId) {
    return mAllBookDao
        .getAllBookEventStream()
        .startWith(mAllBookDao.getSingleBookStream(bookId))
        .map((event) => mAllBookDao.getSingleBook(bookId));
  }

  @override
  Stream<List<BookVO>?> getBooksByCategoryFromDatabase(String category) {
    return mAllBookDao
        .getAllBookEventStream()
        .startWith(mAllBookDao.getSearchBooksByCategoryStream(category))
        .map((event) => mAllBookDao.getSearchBooksByCategory(category));
  }

  @override
  Stream<List<BookVO>?> filterBookListByCategory(List<String> categoryList) {
    return mViewedBookDao
        .getAllViewedBookEventStream()
        .startWith(mViewedBookDao.filterBookByCategoryStream(categoryList))
        .map((event) => mViewedBookDao.filterBookByCategory(categoryList));
  }
}
