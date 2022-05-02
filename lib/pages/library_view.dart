import 'package:flutter/material.dart';
import 'package:library_app/data/vos/genre_vo.dart';
import 'package:library_app/data/vos/shelve_vo.dart';
import 'package:library_app/enums.dart';
import 'package:library_app/pages/your_book_view.dart';
import 'package:library_app/pages/your_shelves_view.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/viewitems/tab_bar_view.dart';

class LibraryView extends StatelessWidget {
  final List<String> libraryTabBarNames;
  final Function(int) onTapLibraryTabBar;
  final Function(int) onTapChip;
  final Function onTapChipCancel;
  final List<GenreVO> chipList;
  final SortedType sortedType;
  final ViewType viewType;
  final Function onChangeSort;
  final Function onChangeView;
  final PageController pageController;
  final Function onTapShelvesList;
  final Function onTapBook;
  final Function onTapBookSeeMore;
  final Function onTapCreateShelve;
  final List<ShelveVO> shelveList;

  const LibraryView(
    this.onTapLibraryTabBar, {
    required this.pageController,
    required this.onTapChipCancel,
    required this.onTapChip,
    required this.libraryTabBarNames,
    required this.chipList,
    required this.sortedType,
    required this.viewType,
    required this.onChangeSort,
    required this.onChangeView,
    required this.onTapShelvesList,
    required this.onTapBook,
    required this.onTapBookSeeMore,
    required this.shelveList,
    required this.onTapCreateShelve,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: APPBAR_HEIGHT,
        ),
        TabBarSectionView((selectedIndex) {
          onTapLibraryTabBar(selectedIndex);
        }, tabBarNames: libraryTabBarNames),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            children: [
              YourBooksView(
                  onTapBook: () {
                    onTapBook();
                  },
                  onTapBookSeeMore: () {
                    onTapBookSeeMore();
                  },
                  chipList: chipList,
                  onTapChip: onTapChip,
                  onTapChipCancel: onTapChipCancel,
                  sortedType: sortedType,
                  onChangeSort: onChangeSort,
                  viewType: viewType,
                  onChangeView: onChangeView),
              YourShelvesView(
                () {
                  onTapShelvesList();
                },
                shelveList: shelveList,
                onTapCreateNewShelve: () {
                  onTapCreateShelve();
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
