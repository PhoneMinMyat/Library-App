import 'package:flutter/material.dart';

import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/widgets/book_status_icon.dart';

class CarouselBookItem extends StatelessWidget {
  final BookVO book;
  final Function(String) onTapCarousel;
  const CarouselBookItem({
    Key? key,
    required this.book,
    required this.onTapCarousel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCarousel(book.primaryIsbn10 ?? '');
      },
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MARGIN_LARGE)),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2x),
                child: (book.bookImage == null)
                    ? Padding(
                        padding: const EdgeInsets.all(MARGIN_MEDIUM_2x),
                        child: Image.asset('assets/images/book.png'),
                      )
                    : Image.network(
                        book.bookImage ?? '',
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MARGIN_SMALL, vertical: MARGIN_MEDIUM),
                child: BookStatusIconBackground(
                  child: Icon(
                    Icons.headphones,
                    color: Colors.white,
                    size: MARGIN_MEDIUM_2x,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MARGIN_SMALL, vertical: MARGIN_MEDIUM),
                child: BookStatusIconBackground(
                  child: Icon(
                    Icons.download_done,
                    color: Colors.white,
                    size: MARGIN_MEDIUM_2x,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
