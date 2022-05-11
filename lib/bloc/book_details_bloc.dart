import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/ny_times_model.dart';
import 'package:library_app/data/models/ny_times_model_impl.dart';
import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/data/vos/book_vo.dart';

class BookDetailsBloc extends ChangeNotifier {
  final NyTimesModel _model = NyTimesModelImpl();
  bool isDispose = false;

  //State Variables
  BookVO? book;
  BookListVO? similarBooks;

  BookDetailsBloc(String bookId) {
    _model.getSingleBookFromDatabase(bookId).listen((bookFromDatabase) {
      book = bookFromDatabase;

      if (book?.category != null) {
        _model
            .getBooksByCategoryFromDatabase(book?.category ?? '')
            .listen((books) {
          similarBooks = BookListVO(listName: book?.category, booksList: books);
          
          safeNotifyListeners();
        }).onError((error) => print(error));
      }
      safeNotifyListeners();
      _model.saveViewedBook(book ?? BookVO());
    }).onError((error) => print(error));
  }

  void safeNotifyListeners() {
    if (isDispose == false) {
      notifyListeners();
    }
  }

  void makeDispose() {
    if (isDispose == false) {
      isDispose = true;
    }
  }
}
