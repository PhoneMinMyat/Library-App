import 'package:flutter/material.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/widgets/book_status_icon.dart';

class BookViewItem extends StatelessWidget {
  final Function onTapBook;
  final bool isHome;
  final bool isSample;
  final bool isDownloaded;
  const BookViewItem(
    this.onTapBook, {
    this.isHome = true,
    this.isSample = false,
    this.isDownloaded = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapBook();
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
                    child: Image.network(
                      'https://www.skipprichard.com/wp-content/uploads/2016/01/9780062367556.jpg',
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
            const Text(
              'Church of Marvels',
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
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
