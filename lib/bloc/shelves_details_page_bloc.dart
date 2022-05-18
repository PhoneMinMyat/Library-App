import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/ny_times_model.dart';
import 'package:library_app/data/models/ny_times_model_impl.dart';
import 'package:library_app/data/vos/category_chip_vo.dart';
import 'package:library_app/enums.dart';

import '../data/vos/book_vo.dart';

class ShelvesDetailsPageBloc extends ChangeNotifier {
  //Variables
  bool isDispose = false;

  //State Variables
  SortedType sortedType = SortedType.recentlyOpened;
  List<BookVO>? bookListFromShelf;
  List<BookVO>? allBookListFromShelf;
  ViewType viewType = ViewType.values[0];
  List<CategoryChipVO>? categoryChipList;
  Set<String> tempCategoryChipList = {};
  int? tempShelfId;
  String? shelfTitle;
  bool isEditing = false;

   NyTimesModel _nyTimesModel = NyTimesModelImpl();

  ShelvesDetailsPageBloc(int shelvesId, [NyTimesModel? nyTimesModel]) {
    if(nyTimesModel != null){
      _nyTimesModel = nyTimesModel;
    }
    tempShelfId = shelvesId;
    _nyTimesModel.getShelfById(shelvesId).listen((shelf) {
      bookListFromShelf = shelf?.bookList ?? [];
      allBookListFromShelf = shelf?.bookList ?? [];
      shelfTitle = shelf?.name ?? '';

      bookListFromShelf?.forEach((book) {
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

  void onTapRename() {
    isEditing = true;
    safeNotifyListeners();
  }

  void renameShelf(String name) {
    _nyTimesModel.renameShelf(tempShelfId ?? 0, name);
    isEditing = false;
    safeNotifyListeners();
  }

  void filterBook() {
    List<String> categoryNameList = categoryChipList
            ?.where((element) => element.isSelected == true)
            .map((category) => category.name)
            .toList() ??
        [];
    print(categoryNameList);
    if (categoryNameList.isEmpty) {
      bookListFromShelf = allBookListFromShelf;
    } else {
      List<BookVO> tempBookList = [];
      categoryNameList.forEach(
        (category) {
          List<BookVO> resultBookList = allBookListFromShelf
                  ?.where((book) => book.category == category)
                  .toList() ??
              [];
          tempBookList.addAll(resultBookList);
        },
      );
      bookListFromShelf = tempBookList;
    }
    safeNotifyListeners();
  }

  void deleteShelf() {
    _nyTimesModel.deleteShelf(tempShelfId ?? 0);
  }

  void removeBookFromShelf(String bookId) {
    _nyTimesModel.removeBookFromShelf(tempShelfId ?? 0, bookId);
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

  void changeSort(int selectedSortedType) {
    sortedType = SortedType.values[selectedSortedType];
    List<BookVO> tempBookList = bookListFromShelf ?? [];
    switch (sortedType) {
      case SortedType.recentlyOpened:
        tempBookList.sort(
            (a, b) => b.userViewedTime?.compareTo(a.userViewedTime ?? '') ?? 0);
        bookListFromShelf = tempBookList;
        break;

      case SortedType.title:
        tempBookList.sort((a, b) => a.title?.compareTo(b.title ?? '') ?? 0);
        bookListFromShelf = tempBookList;
        break;

      case SortedType.author:
        tempBookList.sort((a, b) => a.author?.compareTo(b.author ?? '') ?? 0);
        bookListFromShelf = tempBookList;
        break;
    }
    safeNotifyListeners();
  }

  void deleteBookFromLibrary(String bookId) {
    _nyTimesModel.deleteViewBook(bookId);
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
