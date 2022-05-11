import 'package:flutter/material.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';
import 'package:library_app/viewitems/image_and_title_section_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BookMoreModalBottomSheetView extends StatelessWidget {
  final BookVO book;
  const BookMoreModalBottomSheetView({required this.book,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_3x, vertical: MARGIN_MEDIUM),
            height: BOOK_BOTTOM_MODAL_TITLE_HEIGHT,
            child:  ImageAndTitleSectionView(
                imageUrl: book.bookImage ?? '',
                  title: book.title ?? '',
                  author: book.author ?? '',
                ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black54, width: 0.5))),
          ),
          const SizedBox(
            height: MARGIN_MEDIUM,
          ),
          const ActionSectionView()
        ],
      ),
    );
  }
}

class ActionSectionView extends StatelessWidget {
  const ActionSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: const [
          SizedBox(
            height: BOOK_BOTTOM_MODAL_LISTTILE_HEIGHT,
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                Icons.view_sidebar_outlined,
                color: Colors.black87,
              ),
              title: Text(
                OPEN_SERIES,
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
          SizedBox(
            height: BOOK_BOTTOM_MODAL_LISTTILE_HEIGHT,
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                MdiIcons.trayArrowDown,
                color: Colors.black87,
              ),
              title: Text(
                DOWNLOAD,
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
          SizedBox(
            height: BOOK_BOTTOM_MODAL_LISTTILE_HEIGHT,
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                MdiIcons.trashCanOutline,
                color: Colors.black87,
              ),
              title: Text(
                DELETE_FROM_LIB,
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
          SizedBox(
            height: BOOK_BOTTOM_MODAL_LISTTILE_HEIGHT,
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                MdiIcons.check,
                color: Colors.black87,
              ),
              title: Text(
                MARK_AS_FINISHED,
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
          SizedBox(
            height: BOOK_BOTTOM_MODAL_LISTTILE_HEIGHT,
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                MdiIcons.plus,
                color: Colors.black87,
              ),
              title: Text(
                ADD_TO_SHELF,
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
          SizedBox(
            height: BOOK_BOTTOM_MODAL_LISTTILE_HEIGHT,
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                MdiIcons.bookOutline,
                color: Colors.black87,
              ),
              title: Text(
                ABOUT_THIS_BOOK,
                style: TextStyle(color: Colors.black87),
              ),
            ),
          )
        ],
      ),
    );
  }
}
