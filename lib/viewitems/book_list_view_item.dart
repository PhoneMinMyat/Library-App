import 'package:flutter/material.dart';

import 'package:library_app/resources/dimens.dart';
import 'package:library_app/viewitems/image_and_title_section_view.dart';

class BookListItem extends StatelessWidget {
  final Function onTapBook;
  final Function onTapBookSeeMore;
  const BookListItem({
    Key? key,
    required this.onTapBook,
    required this.onTapBookSeeMore,
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
              onTapBook();
            },
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: const ImageAndTitleSectionView(
                  title: 'Never Send a Human to Do a Machine\'s Job',
                  author: 'Yong Zhao, Gaoming Zhang,Jin Xijinga',
                  type: 'Ebook . Sample',
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
