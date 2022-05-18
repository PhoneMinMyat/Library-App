import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/ny_times_model.dart';
import 'package:library_app/data/models/ny_times_model_impl.dart';
import 'package:library_app/data/vos/book_vo.dart';

class AddNewShelfPageBloc extends ChangeNotifier {
  BookVO? selectedBook;
  bool isDispose = false;

   NyTimesModel _model = NyTimesModelImpl();

  AddNewShelfPageBloc(String bookId,[NyTimesModel? nyTimesModel]) {
    if(nyTimesModel != null){
      _model = nyTimesModel;
    }

    if (bookId.isNotEmpty) {
      _model.getSingleBookFromDatabase(bookId).listen((book) {
        selectedBook = book;
        safeNotifyListeners();
      }).onError((error) => print(error));
    }
  }

  void saveShelf(String shelfName) {
    _model.saveShelf(
      shelfName,
      (selectedBook == null) ? null : selectedBook,
    );
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
