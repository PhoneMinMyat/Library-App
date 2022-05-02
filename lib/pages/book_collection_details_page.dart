import 'package:flutter/material.dart';
import 'package:library_app/dummy_datas.dart';
import 'package:library_app/pages/book_details_page.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/viewitems/book_view_item.dart';

class BookCollectionDetailsPage extends StatelessWidget {
  final String titleName;
  const BookCollectionDetailsPage({
    Key? key,
    required this.titleName,
  }) : super(key: key);

  void onTapBookItem(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const BookDetailsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarForCollectionDetails(titleName: titleName),
      body: GridView.builder(
        padding: const EdgeInsets.all( MARGIN_MEDIUM_2x),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: MARGIN_MEDIUM_2x, crossAxisSpacing: MARGIN_MEDIUM,
              crossAxisCount: 2, childAspectRatio: 1.5 / 2),
          shrinkWrap: true,
          itemCount: dummyBookList.length,
          itemBuilder: (context, index) {
            return BookViewItem(() {
              onTapBookItem(context);
            });
          }),
    );
  }
}

class CustomAppBarForCollectionDetails extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarForCollectionDetails({
    Key? key,
    required this.titleName,
  })  : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  final String titleName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      shape:
          const Border(bottom: BorderSide(color: Colors.black54, width: 0.5)),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black54,
        ),
      ),
      title: Text(
        titleName,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: TEXT_REGULAR_2x),
      ),
      titleSpacing: 0,
    );
  }

  @override
  final Size preferredSize;
}
