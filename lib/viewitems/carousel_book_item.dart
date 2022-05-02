import 'package:flutter/material.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/widgets/book_status_icon.dart';

class CarouselBookItem extends StatelessWidget {
  const CarouselBookItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      //TODO
     // shape: ,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/book.jpg',
            fit: BoxFit.cover,
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
    );
  }
}
