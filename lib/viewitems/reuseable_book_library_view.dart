import 'package:flutter/material.dart';

import 'package:library_app/data/vos/genre_vo.dart';
import 'package:library_app/enums.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/viewitems/book_list_view_item.dart';
import 'package:library_app/viewitems/book_view_item.dart';

class ReuseableBookLibrayView extends StatelessWidget {
  final Function(int) onTapChip;
  final Function onTapChipCancel;
  final List<GenreVO> chipList;
  final SortedType sortedType;
  final ViewType viewType;
  final Function onChangeSort;
  final Function onChangeView;
  final Function onTapBook;
  final Function onTapBookSeeMore;
  const ReuseableBookLibrayView({
    Key? key,
    required this.onTapChip,
    required this.onTapChipCancel,
    required this.chipList,
    required this.sortedType,
    required this.viewType,
    required this.onChangeSort,
    required this.onChangeView,
    required this.onTapBook,
    required this.onTapBookSeeMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isChipSelect = chipList.any((element) => element.isSelected == true);
    String getSortedText() {
      switch (sortedType) {
        case SortedType.recentlyOpened:
          return 'Recent';
        case SortedType.title:
          return 'Title';
        case SortedType.author:
          return 'Author';
      }
    }

    IconData getViewIcon() {
      switch (viewType) {
        case ViewType.list:
          return Icons.view_list;
        case ViewType.largeItems:
          return Icons.grid_view;
        case ViewType.mediumItems:
          return Icons.grid_on;
      }
    }

    Widget _getBookListOptions() {
      switch (viewType) {
        case ViewType.list:
          return BookListView(
            onTapBook: () {
              onTapBook();
            },
            onTapBookSeeMore: (){
              onTapBookSeeMore();
            },
          );
        case ViewType.largeItems:
          return BookGridView(
            crossAxisCount: 2,
            onTapBook: () {
              onTapBook();
            },
          );
        case ViewType.mediumItems:
          return BookGridView(
            crossAxisCount: 3,
            onTapBook: () {
              onTapBook();
            },
          );
      }
    }

    String getViewText() {
      switch (viewType) {
        case ViewType.list:
          return 'List';
        case ViewType.largeItems:
          return 'Grid Large';
        case ViewType.mediumItems:
          return 'Grid Small';
      }
    }

    return Column(
      //mainAxisSize: MainAxisSize.min,
      children: [
        ChipSectionView(
            isChipSelect: isChipSelect,
            chipList: chipList,
            onTapChipCancel: onTapChipCancel,
            onTapChip: onTapChip),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
          child: SortAndViewSectionView(
            onChangeSort: onChangeSort,
            onChangeView: onChangeView,
            sortText: getSortedText(),
            viewText: getViewText(),
            viewIconData: getViewIcon(),
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
            child: _getBookListOptions(),
          ),
        )
      ],
    );
  }
}

class BookGridView extends StatelessWidget {
  final int crossAxisCount;
  final Function onTapBook;
  const BookGridView({
    required this.onTapBook,
    required this.crossAxisCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.5,
            mainAxisSpacing: MARGIN_MEDIUM_2x,
            crossAxisCount: crossAxisCount),
        itemBuilder: (context, index) {
          return BookViewItem(
            () {
              onTapBook();
            },
            isHome: false,
            isDownloaded: true,
            isSample: true,
          );
        });
  }
}

class BookListView extends StatelessWidget {
  final Function onTapBook;
  final Function onTapBookSeeMore;
  const BookListView({
    Key? key,
    required this.onTapBook,
    required this.onTapBookSeeMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return BookListItem(
            onTapBook: () {
              onTapBook();
            },
            onTapBookSeeMore: (){
              onTapBookSeeMore();
            },
          );
        });
  }
}

class SortAndViewSectionView extends StatelessWidget {
  final String sortText;
  final String viewText;
  final IconData viewIconData;
  final Function onChangeSort;
  final Function onChangeView;
  const SortAndViewSectionView({
    Key? key,
    required this.sortText,
    required this.viewText,
    required this.viewIconData,
    required this.onChangeSort,
    required this.onChangeView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Sort by: $sortText',
          style: const TextStyle(color: Colors.grey, fontSize: TEXT_SMALL_2x),
        ),
        const SizedBox(
          width: MARGIN_MEDIUM,
        ),
        GestureDetector(
          onTap: () {
            onChangeSort();
          },
          child: const Icon(
            Icons.sort,
            color: Colors.grey,
          ),
        ),
        const Spacer(),
        Text(
          'View: $viewText',
          style: const TextStyle(color: Colors.grey, fontSize: TEXT_SMALL_2x),
        ),
        const SizedBox(
          width: MARGIN_MEDIUM,
        ),
        GestureDetector(
          onTap: () {
            onChangeView();
          },
          child: Icon(
            viewIconData,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}

class ChipSectionView extends StatelessWidget {
  const ChipSectionView({
    Key? key,
    required this.isChipSelect,
    required this.chipList,
    required this.onTapChipCancel,
    required this.onTapChip,
  }) : super(key: key);

  final bool isChipSelect;
  final List<GenreVO> chipList;
  final Function onTapChipCancel;
  final Function(int) onTapChip;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2x),
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: (isChipSelect) ? chipList.length + 1 : chipList.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: MARGIN_MEDIUM,
        ),
        itemBuilder: (context, index) {
          if (isChipSelect) {
            if (index == 0) {
              return ChipCancelButton(onTapChipCancel: () {
                onTapChipCancel();
              });
            } else {
              return CustomChip(
                (id) {
                  onTapChip(id);
                },
                genre: chipList[index - 1],
              );
            }
          } else {
            {
              return CustomChip((id) {
                onTapChip(id);
              }, genre: chipList[index]);
            }
          }
        },
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final GenreVO genre;
  final Function(int) onChipTap;
  const CustomChip(
    this.onChipTap, {
    Key? key,
    required this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChipTap(genre.id);
      },
      child: Chip(
        label: Text(genre.name),
        backgroundColor: (genre.isSelected) ? Colors.blue : Colors.white,
        side: (genre.isSelected)
            ? null
            : const BorderSide(color: Colors.black, width: 0.2),
      ),
    );
  }
}

class ChipCancelButton extends StatelessWidget {
  const ChipCancelButton({
    Key? key,
    required this.onTapChipCancel,
  }) : super(key: key);

  final Function onTapChipCancel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapChipCancel();
      },
      child: Container(
        padding: const EdgeInsets.all(MARGIN_SMALL),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 0.2,
          ),
        ),
        child: const Icon(
          Icons.close,
          size: MARGIN_MEDIUM_2x,
        ),
      ),
    );
  }
}
