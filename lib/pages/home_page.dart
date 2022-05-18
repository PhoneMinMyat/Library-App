import 'package:flutter/material.dart';
import 'package:library_app/pages/search_page.dart';
import 'package:library_app/widget_keys.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:library_app/data/vos/category_chip_vo.dart';
import 'package:library_app/dummy_datas.dart';
import 'package:library_app/enums.dart';
import 'package:library_app/pages/home_view.dart';
import 'package:library_app/pages/library_view.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavigationSelecetedIndex = 0;
  List<String> collectionTitle = eBooksCollectionTitle;
  List<CategoryChipVO> genreChipList = genreList;
  final PageController _pageController = PageController();

  SortedType sortedType = SortedType.recentlyOpened;

  ViewType viewType = ViewType.values[0];

  void tapBottomNavigationButton(selectedIndex) {
    setState(() {
      bottomNavigationSelecetedIndex = selectedIndex;
      _pageController.jumpToPage(selectedIndex);
    });
  }

  void onTapBookListMore(String title) {}

  void onTapSearchBar() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SearchPage()));
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
              children: const [
                HomeView(),
                LibraryView(),
              ],
            ),
            Align(
                alignment: Alignment.topCenter,
                child: CustomAppBarWithSearchBar(
                  onTapSearchBar: () {
                    onTapSearchBar();
                  },
                )),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavigationSelecetedIndex,
          onTap: (selectedIndex) => tapBottomNavigationButton(selectedIndex),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.homeOutline,
                key: Key(KEY_HOME_PAGE_BOTTOM_NAVIAGATION_BAR_HOME),
              ),
              label: HOME,
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_books_outlined,
                  key: Key(KEY_HOME_PAGE_BOTTOM_NAVIAGATION_BAR_LIBRARY),
                ),
                label: LIBRARY),
          ],
        ),
      ),
    );
  }
}

class CustomAppBarWithSearchBar extends StatelessWidget {
  final Function onTapSearchBar;
  const CustomAppBarWithSearchBar({
    required this.onTapSearchBar,
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
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
                const SizedBox(
                  width: MARGIN_MEDIUM_2x,
                ),
                Flexible(
                    child: TextField(
                  onTap: () {
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
                Container(
                  width: MARGIN_XLARGE,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2x),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8OU02OGhrQzYzSDR8fGVufDB8fHx8&auto=format&fit=crop&w=420&q=60',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
