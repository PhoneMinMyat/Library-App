import 'package:flutter/material.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/viewitems/book_collection_section.dart';

class BookCollectionListViewSection extends StatelessWidget {
  const BookCollectionListViewSection({
    Key? key,
    required this.collectionTitles,
    required this.onTapBook,
    required this.onTapMore,
  }) : super(key: key);

  final List<String> collectionTitles;
  final Function onTapBook;
  final Function(String) onTapMore;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: collectionTitles.length,
      itemBuilder: (context, index) => BookCollectionSection(
        () {
          onTapBook();
        },
        titleName: collectionTitles[index],
        onTapMore: (title){onTapMore(title);},
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: MARGIN_MEDIUM_2x,
      ),
    );
  }
}