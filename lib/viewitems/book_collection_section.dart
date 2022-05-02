import 'package:flutter/material.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/viewitems/book_view_item.dart';

class BookCollectionSection extends StatelessWidget {
  final Function onTapBookItem;
  final Function(String) onTapMore;
  final String titleName;
  const BookCollectionSection(
    this.onTapBookItem, {required this.titleName,required this.onTapMore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
         Padding(
          padding:const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
          child: TitleSectionView(titleName: titleName,onTapMore: (title){onTapMore(title);},),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        SizedBox(
          height: HORIZONTAL_BOOK_LIST_VIEW_HEIGHT,
          child: ListView.builder(
              padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2x),
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BookViewItem(() {
                  onTapBookItem();
                });
              }),
        )
      ],
    );
  }
}

class TitleSectionView extends StatelessWidget {
  final String titleName;
  final Function(String) onTapMore;
  const TitleSectionView({required this.titleName,required this.onTapMore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          titleName,
          style:
             const TextStyle(fontSize: TEXT_REGULAR_2x, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            onTapMore(titleName);
          },
          child: const Icon(Icons.navigate_next),
        )
      ],
    );
  }
}
