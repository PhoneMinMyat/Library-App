import 'package:flutter/material.dart';
import 'package:library_app/pages/your_book_view.dart';
import 'package:library_app/pages/your_shelves_view.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';
import 'package:library_app/viewitems/tab_bar_view.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({
    Key? key,
  }) : super(key: key);

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  final PageController _libraryPageController = PageController();

  void onTapLibraryTabBar(int selectedIndex) {
    setState(() {
      _libraryPageController.jumpToPage(selectedIndex);
    });
  }

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
        }, tabBarNames: const [YOUR_BOOKS, YOUR_SHELVES]),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        Expanded(
          child: PageView(
            controller: _libraryPageController,
            children: const [YourBooksView(), YourShelvesView()],
          ),
        ),
      ],
    );
  }
}
