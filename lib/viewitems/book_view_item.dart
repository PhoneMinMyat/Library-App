import 'package:flutter/material.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/widgets/book_status_icon.dart';

class BookViewItem extends StatelessWidget {
  final Function(String) onTapBook;
  final bool isHome;
  final bool isSample;
  final bool isDownloaded;
  final BookVO book;
  const BookViewItem(
    this.onTapBook, {
    this.isHome = true,
    this.isSample = false,
    this.isDownloaded = false,
    required this.book,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapBook(book.primaryIsbn10 ?? '');
      },
      child: Container(
       
        width:  BOOK_ITEM_WIDTH,
        margin: const EdgeInsets.only(right: MARGIN_MEDIUM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: (book.bookImage == null)?
                      Padding(
                        padding: const EdgeInsets.all(MARGIN_MEDIUM_2x),
                        child: Image.asset('assets/images/book.png'),
                      )
                     :Image.network(
                      book.bookImage ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Visibility(
                    visible: !isHome,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: MARGIN_SMALL, vertical: MARGIN_MEDIUM),
                        child: BookStatusIconBackground(
                          child: Icon(
                            (isDownloaded)
                                ? Icons.download_done
                                : Icons.download,
                            color: Colors.white,
                            size: MARGIN_MEDIUM_2x,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN_SMALL, vertical: MARGIN_MEDIUM),
                      child: (isSample)
                          ? const BookStatusIconBackground(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: MARGIN_SMALL,
                                    vertical: MARGIN_SMALL),
                                child: Text(
                                  'Sample',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: TEXT_SMALL),
                                ),
                              ),
                            )
                          : null,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: MARGIN_SMALL,
            ),
             Text(
              book.title ?? '',
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: TEXT_SMALL_2x,
              ),
            ),
          ],
        ),
        //color: Colors.red,
      ),
    );
  }
}
