import 'package:flutter/material.dart';
import 'package:library_app/resources/dimens.dart';

class BookStatusIconBackground extends StatelessWidget {
  final Widget child;
  const BookStatusIconBackground({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MARGIN_MEDIUM_3x,
      // height: MARGIN_MEDIUM_3x,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(MARGIN_SMALL),
      ),
      child: child,
    );
  }
}
