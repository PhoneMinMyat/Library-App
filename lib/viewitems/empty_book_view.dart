

import 'package:flutter/material.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';

class EmptyBookView extends StatelessWidget {
  final bool isSearchView;
  final bool isYourShelfView;
  const EmptyBookView(
      {this.isSearchView = false, this.isYourShelfView = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: MARGIN_XXLARGE,
          ),
          Image.asset(
          (isYourShelfView)? 'assets/images/shelves.png' :  'assets/images/library.png',
            height: EMPTY_VIEW_HEIGHT,
          ),
          const SizedBox(
            height: MARGIN_MEDIUM_3x,
          ),
          Text(
            (isYourShelfView)
                ? EMPTY_MESSAGE_FOR_SHELF
                : (isSearchView)
                    ? EMPTY_MESSAGE_FOR_SEARCH_RESULT
                    : EMPTY_MESSAGE_IN_LIBRAY,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54, fontSize: TEXT_REGULAR_3x),
          ),
        ],
      ),
    );
  }
}
