import 'package:flutter/material.dart';
import 'package:library_app/data/vos/genre_vo.dart';
import 'package:library_app/enums.dart';
import 'package:library_app/viewitems/reuseable_book_library_view.dart';

class YourBooksView extends StatelessWidget {
  const YourBooksView({
    Key? key,
    required this.chipList,
    required this.onTapChip,
    required this.onTapChipCancel,
    required this.sortedType,
    required this.onChangeSort,
    required this.viewType,
    required this.onChangeView,
    required this.onTapBook,
    required this.onTapBookSeeMore,
  }) : super(key: key);

  final List<GenreVO> chipList;
  final Function(int) onTapChip;
  final Function onTapChipCancel;
  final SortedType sortedType;
  final Function onChangeSort;
  final ViewType viewType;
  final Function onChangeView;
  final Function onTapBook;
  final Function onTapBookSeeMore;

  @override
  Widget build(BuildContext context) {
    return ReuseableBookLibrayView(
      onTapBook: () {
        onTapBook();
      },
      onTapBookSeeMore: (){
        onTapBookSeeMore();
      },
      chipList: chipList,
      onTapChip: (selectedId) {
        onTapChip(selectedId);
      },
      onTapChipCancel: () {
        onTapChipCancel();
      },
      sortedType: sortedType,
      onChangeSort: () {
        onChangeSort();
      },
      viewType: viewType,
      onChangeView: () {
        onChangeView();
      },
    );
  }
}