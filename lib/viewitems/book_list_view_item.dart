import 'package:flutter/material.dart';
import 'package:library_app/data/vos/book_vo.dart';

import 'package:library_app/resources/dimens.dart';
import 'package:library_app/viewitems/image_and_title_section_view.dart';

class BookListItem extends StatelessWidget {
  final Function(String) onTapBook;
  final Function onTapBookSeeMore;
  final BookVO book;
  const BookListItem({
    Key? key,
    required this.onTapBook,
    required this.onTapBookSeeMore,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: BOOK_LIST_ITEM_HEIGHT,
      margin: const EdgeInsets.only(bottom: MARGIN_MEDIUM),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              onTapBook(book.primaryIsbn10 ?? '');
            },
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ImageAndTitleSectionView(
                  imageUrl: book.bookImage ?? '',
                  title: book.title ?? '',
                  author: book.author ?? '',
                )),
          ),
          const Spacer(),
          const Icon(
            Icons.download_done,
            color: Colors.grey,
            size: MARGIN_MEDIUM_3x,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              onTapBookSeeMore();
            },
            child: const Icon(
              Icons.more_horiz,
              color: Colors.grey,
              size: MARGIN_MEDIUM_3x,
            ),
          ),
        ],
      ),
    );
  }
}
