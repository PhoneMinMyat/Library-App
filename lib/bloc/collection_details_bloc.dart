import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/ny_times_model.dart';
import 'package:library_app/data/models/ny_times_model_impl.dart';
import 'package:library_app/data/vos/book_vo.dart';

class CollectionDetailsBloc extends ChangeNotifier {
  final NyTimesModel _model = NyTimesModelImpl();
  bool isDispose = false;
  int bookOffset = 0;
  String listName = '';

  //State Variables
  List<BookVO>? bookList;

  CollectionDetailsBloc(String list) {
    listName = list;
    getBookList(list, bookOffset);
  }

  void getBookList(String list, int offset) {
    print('call get Book List');
    List<BookVO> tempBookList = [];
    _model
        .getBookCategoryListDetails(list, (offset * 20).toString())
        .then((returnBookList) {
      tempBookList.addAll(returnBookList ?? []);
      if(bookList == null){
        bookList = tempBookList;
      }else{
        bookList?.addAll(tempBookList);
      }

      safeNotifyListeners();
    }).catchError((error) => print(error));
  }

  void onBookListReachedEnd() {
    bookOffset += 1;
    getBookList(listName, bookOffset);
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
