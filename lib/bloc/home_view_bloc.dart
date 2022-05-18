import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/ny_times_model.dart';
import 'package:library_app/data/models/ny_times_model_impl.dart';
import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/data/vos/book_vo.dart';

class HomeViewBloc extends ChangeNotifier {
  //Variables
  bool isDispose = false;

  //State Variables
  List<BookListVO>? bookCollectionList;
  List<BookVO>? recentViewedBookList;

  NyTimesModel _model = NyTimesModelImpl();

  HomeViewBloc([NyTimesModel? nyTimesModel]) {
    if (nyTimesModel != null) {
      _model = nyTimesModel;
    }

    _model.getOverviewBookListFromDatabase().listen((bookList) {
      bookCollectionList = bookList;
      safeNotifyListeners();
    }).onError((error) => print(error));

    _model.getViewedBookListFromDatabase().listen((bookList) {
      List<BookVO> tempBookList = bookList;
      tempBookList.sort(
          (a, b) => a.userViewedTime?.compareTo(b.userViewedTime ?? '') ?? 0);
      recentViewedBookList = tempBookList.reversed.toList();
      safeNotifyListeners();
    }).onError((error) => print(error));
  }

  void onTapHomeTabBar(int selectedIndex) {
    if (selectedIndex == 0) {
    } else {}
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
