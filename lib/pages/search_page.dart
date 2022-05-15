import 'package:flutter/material.dart';
import 'package:library_app/bloc/search_page_bloc.dart';
import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/debouncer.dart';
import 'package:library_app/viewitems/image_and_title_section_view.dart';
import 'package:library_app/widget_keys.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/pages/book_collection_details_page.dart';
import 'package:library_app/pages/book_details_page.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';
import 'package:library_app/viewitems/book_collection_listview_section.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _debouncer = Debouncer(milliseconds: 500);

  SearchPageBloc? _bloc;

  @override
  void initState() {
    _bloc = SearchPageBloc();
    super.initState();
  }

  void onTapBookItem(String bookId) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BookDetailsPage(
              bookId: bookId,
            )));
  }

  void onTapBookListMore(String title) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BookCollectionDetailsPage(titleName: title)));
  }

  Widget _getWidgetOption(
      {required bool isFocus,
      required bool isSearching,
      required bool isSearched,
      required List<BookVO> resultSearchBook,
      required List<BookListVO> resultByCategoryList,
      required String searchWordText}) {
    if (isFocus == true && isSearching == false) {
      return FirstSearchList(
        onTapSearchItem: () {
          _bloc?.onSubmmit();
        },
      );
    }

    if (isFocus == false && isSearched == true) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2x),
        child: BookCollectionListViewSection(
            key: const Key(KEY_SEARCH_RESULT_BOOK_VIEW),
            bookCollectionList: resultByCategoryList,
            onTapBook: (tapBook) {
              onTapBookItem(tapBook);
            },
            onTapMore: (title) {
              onTapBookListMore(title);
            }),
      );
    }

    if (isSearching == true) {
      return SearchingResultView(
        key: const Key(KEY_SEARCH_SUGGEST_BOOK_LIST),
        resultBookList: resultSearchBook,
        searchWord: searchWordText,
        onTapBook: (bookId) {
          onTapBookItem(bookId);
        },
        onTapSearchWord: () {
          _bloc?.onSubmmit();
        },
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _bloc,
      builder: (context, child) => Consumer<SearchPageBloc>(
        builder: (context, searchBloc, child) => Scaffold(
          backgroundColor: Colors.white.withOpacity(0.96),
          appBar: CustomAppBarForSearchPage(
            onTapSearchBar: () {
              SearchPageBloc bloc =
                  Provider.of<SearchPageBloc>(context, listen: false);
              bloc.onTapSearchBar();
            },
            onSubmmit: (value) {
              SearchPageBloc bloc =
                  Provider.of<SearchPageBloc>(context, listen: false);

              _debouncer.run(() {
                bloc.onSubmmit();
              });
            },
            isFocus: searchBloc.isFocus ?? false,
            onChangeTextInput: (changeValue) {
              SearchPageBloc bloc =
                  Provider.of<SearchPageBloc>(context, listen: false);

              _debouncer.run(() {
                bloc.runFilter(changeValue);
              });
            },
          ),
          body: SingleChildScrollView(
            child: _getWidgetOption(
                isFocus: searchBloc.isFocus ?? false,
                isSearched: searchBloc.isSearched ?? false,
                isSearching: searchBloc.isSearching ?? false,
                resultSearchBook: searchBloc.resultSearchBook ?? [],
                searchWordText: searchBloc.searchWordText,
                resultByCategoryList:
                    searchBloc.resultSearchBookByCategory ?? []),
          ),
        ),
      ),
    );
  }
}

class SearchingResultView extends StatelessWidget {
  final List<BookVO> resultBookList;
  final String searchWord;
  final Function(String) onTapBook;
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
      padding: const EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM_2x, vertical: MARGIN_MEDIUM_3x),
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
            height: BOOK_SEARCH_RESULT_ITEM_HEIGHT,
            child: GestureDetector(
              onTap: () {
                onTapBook(resultBookList[index].primaryIsbn10 ?? '');
              },
              child: ImageAndTitleSectionView(
                imageUrl: resultBookList[index].bookImage ?? '',
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
    return Column(
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
  final Function(String) onSubmmit;
  final Function onTapSearchBar;
  const CustomAppBarForSearchPage({
    required this.onSubmmit,
    required this.onTapSearchBar,
    required this.isFocus,
    required this.onChangeTextInput,
    Key? key,
  })  : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    String tempText = '';
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
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black54,
          key: Key(KEY_SEARCH_PAGE_BACK_BUTTON),
        ),
      ),
      titleSpacing: 0,
      title: TextField(
        key: const Key(KEY_SEARCH_TEXT_FIELD),
        onSubmitted: (value) {
          onSubmmit(value);
        },
        autofocus: isFocus,
        onChanged: (value) {
          tempText = value;
          onChangeTextInput(value);
        },
        onTap: () {
          onTapSearchBar();
        },
        decoration: const InputDecoration(
            hintText: SEARCH_PLAY_BOOKS, border: InputBorder.none),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            onSubmmit(tempText);
          },
          child: const Icon(
            Icons.search,
            color: Colors.black54,
            key: Key(KEY_SEARCH_ICON_BUTTON),
          ),
        ),
        const SizedBox(
          width: MARGIN_MEDIUM_2x,
        )
      ],
    );
  }

  @override
  final Size preferredSize;
}
