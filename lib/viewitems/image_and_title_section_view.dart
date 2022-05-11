import 'package:flutter/material.dart';
import 'package:library_app/resources/dimens.dart';

class ImageAndTitleSectionView extends StatelessWidget {
  final bool isListItem;
  final String title;
  final String author;
  final String type;
  final String imageUrl;

  const ImageAndTitleSectionView(
      {this.isListItem = true,
      required this.title,
      required this.author,
      this.type = '',
      required this.imageUrl,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          child: (imageUrl.isEmpty)
              ? Padding(
                  padding: const EdgeInsets.all(MARGIN_MEDIUM_2x),
                  child: Image.asset('assets/images/book.png'),
                )
              : Image.network(imageUrl, fit: BoxFit.cover, width:(isListItem)? MARGIN_XXLARGE : null,),
        ),
        const SizedBox(
          width: MARGIN_MEDIUM,
        ),
        Expanded(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: (isListItem) ? 2 : null,
                  overflow: (isListItem) ? TextOverflow.ellipsis : null,
                  style: (isListItem)
                      ? null
                      : const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: TEXT_HEADING),
                ),
                const SizedBox(
                  height: MARGIN_SMALL,
                ),
                Text(
                  author,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: TEXT_SMALL_2x),
                ),
                Text(
                  type,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: TEXT_SMALL_2x),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
