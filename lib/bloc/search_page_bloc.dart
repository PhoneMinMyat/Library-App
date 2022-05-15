import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/google_book_model.dart';
import 'package:library_app/data/models/google_book_model_impl.dart';
import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:collection/collection.dart';

class SearchPageBloc extends ChangeNotifier {
  //Variables
  bool isDispose = false;

  //State Variables
  List<BookVO>? resultSearchBook;
  List<BookListVO>? resultSearchBookByCategory;
  bool? isSearching;
  bool? isFocus;
  bool? isSearched;

  String searchWordText = '';

  final GoogleBookModel _mModel = GoogleBookModelImpl();

  SearchPageBloc() {
    isFocus = true;
    isSearching = false;
    isSearched = false;
  }

  void onTapSearchBar() {
    isFocus = true;
    isSearched = false;
    isSearching = true;
    searchWordText = '';
    safeNotifyListeners();
  }

  void runFilter(String searchWord) {
    resultSearchBook?.clear();
    isSearching = true;
    if (searchWord == '') {
      isFocus = true;
      isSearching = false;
      isSearched = false;
    } else {
      _mModel.getSearchResultBookList(searchWord).then((bookList) {
        resultSearchBook = bookList;
        searchWordText = searchWord;
        safeNotifyListeners();
      }).catchError((error) => print('searchBloc == $error'));
    }

    safeNotifyListeners();
  }

  void onSubmmit() {
    isFocus = false;
    isSearched = true;
    isSearching = false;
    List<BookVO> tempBookList = resultSearchBook ?? [];
    final groups = groupBy(tempBookList, (BookVO obj) => obj.category);
    //print(groups);
   // print(groups.keys);
    resultSearchBookByCategory = groups.keys
        .map((category) =>
            BookListVO(listName: category, booksList: groups[category]))
        .toList();
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
