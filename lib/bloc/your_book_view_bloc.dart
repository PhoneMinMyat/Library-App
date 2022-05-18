import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/ny_times_model.dart';
import 'package:library_app/data/models/ny_times_model_impl.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/enums.dart';

import '../data/vos/category_chip_vo.dart';

class YourBookViewBloc extends ChangeNotifier {
  //Variables
  bool isDispose = false;
  //State Variable
  List<BookVO>? yourBookList;
  SortedType sortedType = SortedType.recentlyOpened;
  ViewType viewType = ViewType.values[0];
  List<CategoryChipVO>? categoryChipList;
  Set<String> tempCategoryChipList = {};

   NyTimesModel _nyTimesModel = NyTimesModelImpl();

  YourBookViewBloc([NyTimesModel? nyTimesModel]) {
    if(nyTimesModel != null){
      _nyTimesModel = nyTimesModel;
    }

    _nyTimesModel.getViewedBookListFromDatabase().listen((bookList) {
      List<BookVO> tempBookList = bookList;
      tempBookList.sort(
          (a, b) => a.userViewedTime?.compareTo(b.userViewedTime ?? '') ?? 0);
      yourBookList = tempBookList.reversed.toList();

      yourBookList?.forEach((book) {
        tempCategoryChipList.add(book.category ?? '');
      });

      categoryChipList = tempCategoryChipList
          .toList()
          .map(
            (categoryName) =>
                CategoryChipVO(name: categoryName, isSelected: false),
          )
          .toList();
      safeNotifyListeners();
    }).onError((error) => print(error));
  }

  void filterBook() {
    List<String> categoryNameList = categoryChipList
            ?.where((element) => element.isSelected == true)
            .map((category) => category.name)
            .toList() ??
        [];
    print(categoryNameList.length);
    _nyTimesModel.filterBookListByCategory(categoryNameList).listen((bookList) {
      List<BookVO> tempBookList = bookList ?? [];
      tempBookList.sort(
          (a, b) => a.userViewedTime?.compareTo(b.userViewedTime ?? '') ?? 0);
      yourBookList = tempBookList.reversed.toList();
    }).onError((error) => print(error));
    safeNotifyListeners();
  }

  void onTapChipCancel() {
    categoryChipList?.forEach((element) {
      element.isSelected = false;
    });
    filterBook();

    safeNotifyListeners();
  }

  void onTapChip(String categoryName) {
    categoryChipList
        ?.firstWhere((element) => element.name == categoryName)
        .onTap();
    filterBook();
    List<CategoryChipVO> tempChipList = categoryChipList ?? [];
    tempChipList.sort(((a, b) {
      if (b.isSelected) {
        return 1;
      } else {
        return -1;
      }
    }));

    categoryChipList = tempChipList;
    safeNotifyListeners();
  }

  void changeSort(int changeValue) {
    sortedType = SortedType.values[changeValue];
    List<BookVO> tempBookList = yourBookList ?? [];
    switch (sortedType) {
      case SortedType.recentlyOpened:
        tempBookList.sort(
            (a, b) => b.userViewedTime?.compareTo(a.userViewedTime ?? '') ?? 0);
        yourBookList = tempBookList;
        break;

      case SortedType.title:
        tempBookList.sort((a, b) => a.title?.compareTo(b.title ?? '') ?? 0);
        yourBookList = tempBookList;
        break;

      case SortedType.author:
        tempBookList.sort((a, b) => a.author?.compareTo(b.author ?? '') ?? 0);
        yourBookList = tempBookList;
        break;
    }
    safeNotifyListeners();
  }

  void onTapChangeView() {
    int tempViewIndex = viewType.index;

    if (tempViewIndex < 2) {
      viewType = ViewType.values[tempViewIndex + 1];
    } else {
      viewType = ViewType.values[0];
    }
    safeNotifyListeners();
  }

  void deleteBookFromLibrary(String bookId) {
    _nyTimesModel.deleteViewBook(bookId);
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
