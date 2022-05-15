import 'package:flutter/material.dart';
import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';
import 'package:library_app/viewitems/book_view_item.dart';

class BookCollectionSection extends StatelessWidget {
  final Function(String) onTapBookItem;
  final Function(String) onTapMore;
  final String listTitleName;
  final BookListVO bookCollection;
  const BookCollectionSection(
    this.onTapBookItem, {
    required this.listTitleName,
    required this.bookCollection,
    required this.onTapMore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (bookCollection.booksList?.isEmpty ?? true)
        ? Container()
        : Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
                child: TitleSectionView(
                  titleName: listTitleName,
                  onTapMore: (title) {
                    onTapMore((title == SIMILAR_EBOOKS)
                        ? bookCollection.listName ?? ''
                        : title);
                  },
                ),
              ),
              const SizedBox(
                height: MARGIN_MEDIUM,
              ),
              SizedBox(
                height: HORIZONTAL_BOOK_LIST_VIEW_HEIGHT,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2x),
                    itemCount: bookCollection.booksList?.length ?? 0,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return BookViewItem(
                        (bookId) {
                          onTapBookItem(bookId);
                        },
                        key: Key(listTitleName +
                            (bookCollection.booksList?[index].title ?? '')),
                        book: bookCollection.booksList?[index] ?? BookVO(),
                      );
                    }),
              )
            ],
          );
  }
}

class TitleSectionView extends StatelessWidget {
  final String titleName;
  final Function(String) onTapMore;
  const TitleSectionView({
    required this.titleName,
    required this.onTapMore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapMore(titleName);
      },
      child: Row(
        children: [
          Text(
            titleName,
            style: const TextStyle(
                fontSize: TEXT_REGULAR_2x, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          const Icon(Icons.navigate_next)
        ],
      ),
    );
  }
}
