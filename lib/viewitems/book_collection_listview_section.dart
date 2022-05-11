import 'package:flutter/material.dart';
import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/viewitems/book_collection_section.dart';

class BookCollectionListViewSection extends StatelessWidget {
  final List<BookListVO> bookCollectionList;
  final Function(String) onTapBook;
  final Function(String) onTapMore;

  const BookCollectionListViewSection({
    Key? key,
    required this.bookCollectionList,
    required this.onTapBook,
    required this.onTapMore,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: bookCollectionList.length,
      itemBuilder: (context, index) => BookCollectionSection(
        (bookId) {
          onTapBook(bookId);
        },
        listTitleName:  bookCollectionList[index].listName ?? 'Unknown',
        bookCollection: bookCollectionList[index],
        onTapMore: (title){onTapMore(title);},
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: MARGIN_MEDIUM_2x,
      ),
    );
  }
}