import 'package:flutter/material.dart';
import 'package:library_app/viewitems/image_and_title_section_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/dummy_datas.dart';
import 'package:library_app/pages/book_collection_details_page.dart';
import 'package:library_app/pages/book_details_page.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';
import 'package:library_app/viewitems/book_collection_listview_section.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool? _isSearching;
  bool? _isFocus;
  bool? _isSearched;

  List<BookVO>? resultSearchBook;
  List<String> collectionTitlesList = eBooksCollectionTitle;
  List<BookVO> databaseBookList = dummyBookList;
  String searchWordText = '';

  @override
  void initState() {
    _isFocus = true;
    _isSearching = false;
    _isSearched = false;
    super.initState();
  }

  void onTapSearchBar() {
    setState(() {
      _isFocus = true;
      _isSearched = true;
      _isSearching = false;
    });
  }

  void runFilter(String searchWord) {
    
    List<BookVO> results = databaseBookList
        .where(
          (book) =>
              book.title?.toLowerCase().contains(
                    searchWord.toLowerCase(),
                  ) ??
              false,
        )
        .toList();

    setState(() {
      resultSearchBook?.clear();
      _isSearching = true;
      resultSearchBook = results;
      searchWordText = searchWord;
    });
  }

  void onTapSearchFirstListItme() {
    setState(() {
      _isFocus = false;
      _isSearched = true;
      _isSearching = false;
    });
    print('focus ==> $_isFocus');
    print('search ==> $_isSearched');
  }

  void onTapBookItem() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const BookDetailsPage()));
  }

  void onTapBookListMore(String title) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BookCollectionDetailsPage(titleName: title)));
  }

  Widget _getWidgetOption() {
    if (_isFocus == true && _isSearching == false) {
      return FirstSearchList(
        onTapSearchItem: () {
          onTapSearchFirstListItme();
        },
      );
    }

    if (_isFocus == false && _isSearched == true) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2x),
        child: BookCollectionListViewSection(
            collectionTitles: collectionTitlesList,
            onTapBook: () {
              onTapBookItem();
            },
            onTapMore: (title) {
              onTapBookListMore(title);
            }),
      );
    }

    if (_isSearching == true) {
      return SearchingResultView(
        resultBookList: resultSearchBook ?? [],
        searchWord: searchWordText,
        onTapBook: () {
          onTapBookItem();
        },
        onTapSearchWord: () {
          onTapSearchFirstListItme();
        },
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarForSearchPage(
        onTapSearchBar: () {
          onTapSearchBar();
        },
        isFocus: _isFocus ?? false,
        onChangeTextInput: (changeValue) {
          runFilter(changeValue);
        },
      ),
      body: _getWidgetOption(),
    );
  }
}

class SearchingResultView extends StatelessWidget {
  final List<BookVO> resultBookList;
  final String searchWord;
  final Function onTapBook;
  final Function onTapSearchWord;
  const SearchingResultView({
    Key? key,
    required this.resultBookList,
    required this.searchWord,
    required this.onTapBook,
    required this.onTapSearchWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x, vertical: MARGIN_MEDIUM_3x),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: resultBookList.length + 1,
        itemBuilder: (context, index) {
          if (index == resultBookList.length) {
            return SearchResultItem(
              iconData: Icons.search,
              title: searchWord,
              onTap: () {
                onTapSearchWord();
              },
            );
          }
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
            height: BOOK_BOTTOM_MODAL_LISTTILE_HEIGHT,
            child: GestureDetector(
              onTap: () {
                onTapBook();
              },
              child: ImageAndTitleSectionView(
                title: resultBookList[index].title ?? '',
                author: resultBookList[index].author ?? '',
                type: 'Ebook . Sample',
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: MARGIN_MEDIUM,
        ),
      ),
    );
  }
}

class FirstSearchList extends StatelessWidget {
  final Function onTapSearchItem;
  const FirstSearchList({
    required this.onTapSearchItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchResultItem(
            onTap: () {
              onTapSearchItem();
            },
            iconData: MdiIcons.chartLineVariant,
            title: TOP_SELLING,
          ),
          SearchResultItem(
            onTap: () {
              onTapSearchItem();
            },
            iconData: MdiIcons.information,
            title: NEW_RELEASES,
          ),
          SearchResultItem(
            onTap: () {
              onTapSearchItem();
            },
            iconData: MdiIcons.store,
            title: BOOKSHOP,
          ),
        ],
      ),
    );
  }
}

class SearchResultItem extends StatelessWidget {
  final Function onTap;
  final IconData iconData;
  final String title;
  const SearchResultItem({
    Key? key,
    required this.onTap,
    required this.iconData,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
      leading: Icon(
        iconData,
        color: Colors.blue,
      ),
      horizontalTitleGap: 0,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black54),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}

class CustomAppBarForSearchPage extends StatelessWidget
    implements PreferredSizeWidget {
  final bool isFocus;
  final Function(String) onChangeTextInput;
  final Function onTapSearchBar;
  const CustomAppBarForSearchPage({
    required this.onTapSearchBar,
    required this.isFocus,
    required this.onChangeTextInput,
    Key? key,
  })  : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      shape:
          const Border(bottom: BorderSide(color: Colors.black54, width: 0.5)),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back, color: Colors.black54),
      ),
      titleSpacing: 0,
      title: TextField(
        autofocus: isFocus,
        onChanged: (value) {
          onChangeTextInput(value);
        },
        onTap: () {
          onTapSearchBar();
        },
        decoration: const InputDecoration(
            hintText: SEARCH_PLAY_BOOKS, border: InputBorder.none),
      ),
    );
  }

  @override
  final Size preferredSize;
}
