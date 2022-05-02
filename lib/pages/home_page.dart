import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:library_app/data/vos/shelve_vo.dart';
import 'package:library_app/pages/add_new_shelf_page.dart';
import 'package:library_app/pages/book_collection_details_page.dart';
import 'package:library_app/pages/search_page.dart';
import 'package:library_app/viewitems/book_more_bottom_modal_sheet_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:library_app/data/vos/genre_vo.dart';
import 'package:library_app/dummy_datas.dart';
import 'package:library_app/enums.dart';
import 'package:library_app/pages/book_details_page.dart';
import 'package:library_app/pages/home_view.dart';
import 'package:library_app/pages/library_view.dart';
import 'package:library_app/pages/shelves_details_page.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';
import 'package:library_app/viewitems/book_shelves_colletion_list_item.dart';
import 'package:library_app/viewitems/reuseable_book_library_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavigationSelecetedIndex = 0;
  List<String> collectionTitle = eBooksCollectionTitle;
  List<GenreVO> genreChipList = genreList;
  final PageController _pageController = PageController();
  final PageController _libraryPageController = PageController();
  SortedType sortedType = SortedType.recentlyOpened;
  List<ShelveVO> shelveList = dummyShelveList;

  ViewType viewType = ViewType.values[0];

  void tapBottomNavigationButton(selectedIndex) {
    setState(() {
      bottomNavigationSelecetedIndex = selectedIndex;
      _pageController.jumpToPage(selectedIndex);
      onTapHomeTabBar(0);
    });
  }

  void onTapHomeTabBar(int selectedIndex) {
    setState(() {
      if (selectedIndex == 0) {
        collectionTitle = eBooksCollectionTitle;
      } else {
        collectionTitle = audioBooksCollectionTitle;
      }
    });
  }

  void onTapLibraryTabBar(int selectedIndex) {
    setState(() {
      _libraryPageController.jumpToPage(selectedIndex);
    });
  }

  void onTapChipCancel() {
    genreChipList.forEach((element) {
      setState(() {
        element.isSelected = false;
      });
    });
  }

  void onTapChip(int id) {
    setState(() {
      genreChipList.firstWhere((element) => element.id == id).onTap();
    });
  }

  void changeSort(int changeValue) {
    setState(() {
      sortedType = SortedType.values[changeValue];
    });
  }

  void onTapChangeSort() {
    int radioValue = sortedType.index;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SortModalBottomSheetView(
              radioVal: radioValue,
              tapRadioButton: (radioValue) {
                changeSort(radioValue);
              });
        });
  }

  void onTapBookMore() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const BookMoreModalBottomSheetView();
        });
  }

  void onTapChangeView() {
    int tempViewIndex = viewType.index;
    setState(() {
      if (tempViewIndex < 2) {
        viewType = ViewType.values[tempViewIndex + 1];
      } else {
        viewType = ViewType.values[0];
      }
    });
  }

  void onTapShelvesList() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ShelvesDetailsPage()));
  }

  void onTapBookItem() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const BookDetailsPage()));
  }

  void onTapBookListMore(String title) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BookCollectionDetailsPage(titleName: title)));
  }

  void onTapCreateShelve() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AddNewShelfPage()));
  }

  void onTapSearchBar(){
     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              allowImplicitScrolling: false,
              children: [
                HomeView(
                  (selectedIndex) {
                    onTapHomeTabBar(selectedIndex);
                  },
                  homeTabBarNames: const [EBOOKS, AUDIOBOOKS],
                  collectionTitles: collectionTitle,
                  onTapBook: () {
                    onTapBookItem();
                  },
                  onTapMore: (title) {
                    onTapBookListMore(title);
                  },
                ),
                LibraryView(
                  (selectedIndex) {
                    onTapLibraryTabBar(selectedIndex);
                  },
                  libraryTabBarNames: const [YOUR_BOOKS, YOUR_SHELVES],
                  onTapBook: () {
                    onTapBookItem();
                  },
                  onTapBookSeeMore: () {
                    onTapBookMore();
                  },
                  onTapChipCancel: () {
                    onTapChipCancel();
                  },
                  onTapChip: (id) {
                    onTapChip(id);
                  },
                  onTapCreateShelve: () {
                    onTapCreateShelve();
                  },
                  chipList: genreChipList,
                  sortedType: sortedType,
                  viewType: viewType,
                  onChangeSort: () {
                    onTapChangeSort();
                  },
                  onChangeView: () {
                    onTapChangeView();
                  },
                  pageController: _libraryPageController,
                  onTapShelvesList: () {
                    onTapShelvesList();
                  },
                  shelveList: shelveList,
                ),
              ],
            ),
             Align(
                alignment: Alignment.topCenter,
                child: CustomAppBarWithSearchBar(onTapSearchBar: (){
                  onTapSearchBar();
                },)),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavigationSelecetedIndex,
          onTap: (selectedIndex) => tapBottomNavigationButton(selectedIndex),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(MdiIcons.homeOutline), label: HOME),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books_outlined), label: LIBRARY),
          ],
        ),
      ),
    );
  }
}

class SortModalBottomSheetView extends StatelessWidget {
  final int radioVal;
  final Function(int) tapRadioButton;
  const SortModalBottomSheetView({
    Key? key,
    required this.radioVal,
    required this.tapRadioButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3x, vertical: MARGIN_MEDIUM_2x),
          child: Text(
            SORT_BY,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: TEXT_REGULAR_2x),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black54, width: 0.5),
            ),
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        ListTile(
          title: const Text(SORT_BY_RECENT),
          leading: Radio(
            value: 0,
            groupValue: radioVal,
            onChanged: (value) {
              tapRadioButton(value as int);
              Navigator.pop(context);
            },
            activeColor: Colors.blue,
          ),
        ),
        ListTile(
          title: const Text(SORT_BY_TITLE),
          leading: Radio(
            value: 1,
            groupValue: radioVal,
            onChanged: (value) {
              tapRadioButton(value as int);
              Navigator.pop(context);
            },
            activeColor: Colors.blue,
          ),
        ),
        ListTile(
          title: const Text(SORT_BY_AUTHOR),
          leading: Radio(
            value: 2,
            groupValue: radioVal,
            onChanged: (value) {
              tapRadioButton(value as int);
              Navigator.pop(context);
            },
            activeColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}

class CustomAppBarWithSearchBar extends StatelessWidget {
  final Function onTapSearchBar;
  const CustomAppBarWithSearchBar({required this.onTapSearchBar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: APPBAR_HEIGHT,
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_2x, vertical: MARGIN_CARD_MEDIUM_2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SEARCH_BAR_BORDER_RADIUS),
        ),
        child: Card(
          elevation: 3,
          borderOnForeground: false,
          child: Padding(
            padding: const EdgeInsets.all(MARGIN_MEDIUM),
            child: Row(
              children:  [
              const  Icon(Icons.search),
              const  SizedBox(
                  width: MARGIN_MEDIUM_2x,
                ),
                Flexible(
                    child: TextField(
                      onTap: (){
                        onTapSearchBar();
                      },
                    readOnly: true,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: MARGIN_MEDIUM_3x),
                      hintText: SEARCH_PLAY_BOOKS,
                      hintStyle: TextStyle(fontSize: 13),
                      border: InputBorder.none),
                )),
               const SizedBox(
                  width: MARGIN_MEDIUM_2x,
                ),
              const  CircleAvatar(
                  child: Icon(Icons.person),
                  backgroundColor: Colors.blueAccent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
