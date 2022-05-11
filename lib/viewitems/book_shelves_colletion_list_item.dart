import 'package:flutter/material.dart';
import 'package:library_app/data/vos/shelf_vo.dart';
import 'package:library_app/resources/dimens.dart';

class BookShelvesCollectionListItem extends StatelessWidget {
  final Function onTapShelvesList;
  final ShelfVO shelve;
  const BookShelvesCollectionListItem(this.onTapShelvesList,
      {required this.shelve, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapShelvesList();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: MARGIN_MEDIUM_2x),
        padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
        width: double.infinity,
        height: BOOK_SHELVES_COLLECTION_HEIGHT,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 0.2),
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(MARGIN_MEDIUM),
                  topRight: Radius.circular(MARGIN_MEDIUM)),
              child: SizedBox(
                width: 60,
                child: Image.network(
                  'https://www.skipprichard.com/wp-content/uploads/2016/01/9780062367556.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: MARGIN_MEDIUM_2x,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    shelve.name ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                const  SizedBox(
                    height: MARGIN_SMALL,
                  ),
                  Text(
                    '${shelve.bookList?.length} books',
                    style:
                       const TextStyle(fontSize: TEXT_SMALL_2x, color: Colors.grey),
                  )
                ],
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.navigate_next,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
