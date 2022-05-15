import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/ny_times_model.dart';
import 'package:library_app/data/models/ny_times_model_impl.dart';
import 'package:library_app/data/vos/shelf_vo.dart';

class AddBookToShelfPageBloc extends ChangeNotifier {
  //Variables
  bool isDispose = false;

  //Variablse

  List<ShelfVO>? shelveList;
  String? tempBookId;

  final NyTimesModel _model = NyTimesModelImpl();

  AddBookToShelfPageBloc(String bookId) {
    tempBookId = bookId;

    _model.getShelfListFromDatabase().listen((shelfListFromDB) {
      shelveList = shelfListFromDB;
      safeNotifyListeners();
    }).onError((error) => print(error));
  }

  void addBook(int shelfId) {
    _model.addBookToShelf(shelfId, tempBookId ?? '');
    safeNotifyListeners();
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
