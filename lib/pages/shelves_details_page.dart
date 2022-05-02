import 'package:flutter/material.dart';
import 'package:library_app/data/vos/genre_vo.dart';
import 'package:library_app/dummy_datas.dart';
import 'package:library_app/enums.dart';
import 'package:library_app/pages/book_details_page.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';
import 'package:library_app/viewitems/book_more_bottom_modal_sheet_view.dart';
import 'package:library_app/viewitems/reuseable_book_library_view.dart';

class ShelvesDetailsPage extends StatefulWidget {
  const ShelvesDetailsPage({Key? key}) : super(key: key);

  @override
  State<ShelvesDetailsPage> createState() => _ShelvesDetailsPageState();
}

class _ShelvesDetailsPageState extends State<ShelvesDetailsPage> {
  SortedType sortedType = SortedType.recentlyOpened;

  ViewType viewType = ViewType.values[0];
  List<GenreVO> genreChipList = genreList;
  void onTapChipCancel() {
    genreChipList.forEach((element) {
      setState(() {
        element.isSelected = false;
      });
    });
  }

  void onTapChip(int id) {
    setState(() {
      genreChipList.firstWhere((element) => element.id == id).onTap();
    });
  }

  void changeSort(SortedType selectedSortedType) {
    setState(() {
      sortedType = selectedSortedType;
    });
  }

  void onTapChangeSort() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text(SORT_BY_RECENT),
                onTap: () {
                  changeSort(SortedType.recentlyOpened);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(SORT_BY_TITLE),
                onTap: () {
                  changeSort(SortedType.title);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(SORT_BY_AUTHOR),
                onTap: () {
                  changeSort(SortedType.author);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void onTapBookItem() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const BookDetailsPage()));
  }

  void onTapChangeView() {
    int tempViewIndex = viewType.index;
    setState(() {
      if (tempViewIndex < 2) {
        viewType = ViewType.values[tempViewIndex + 1];
      } else {
        viewType = ViewType.values[0];
      }
    });
  }

  void onTapBookMore() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const BookMoreModalBottomSheetView();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarForShelves(),
      body: Column(
        children: [
          const TitleSectionView(),
          const SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          Expanded(
              child: ReuseableBookLibrayView(
            onTapBook: () {
              onTapBookItem();
            },
            onTapBookSeeMore: () {
              onTapBookMore();
            },
            chipList: genreChipList,
            onTapChip: (selectedId) {
              onTapChip(selectedId);
            },
            onTapChipCancel: () {
              onTapChipCancel();
            },
            sortedType: sortedType,
            onChangeSort: () {
              onTapChangeSort();
            },
            viewType: viewType,
            onChangeView: () {
              onTapChangeView();
            },
          ))
        ],
      ),
    );
  }
}

class TitleSectionView extends StatelessWidget {
  const TitleSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
      height: SHELVES_DETAILS_PAGE_TITLE_SECTION_HEIGHT,
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black, width: 0.2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '10 Interaction Design Books To Read',
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: TEXT_HEADING_2X),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Text(
            '3 books',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class CustomAppBarForShelves extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarForShelves({
    Key? key,
  })  : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.chevron_left,
          color: Colors.grey,
          size: MARGIN_XLARGE,
        ),
      ),
      actions: [
        PopupMenuButton(
            child: const Icon(
              Icons.more_horiz,
              color: Colors.grey,
              size: MARGIN_XLARGE,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text('Rename shelf'),
                  onTap: () {
                    print('Rename');
                  },
                ),
                PopupMenuItem(
                  child: const Text('Delete shelf'),
                  onTap: () {
                    print('Delete');
                  },
                ),
              ];
            }),
        const SizedBox(
          width: MARGIN_MEDIUM_2x,
        )
      ],
    );
  }

  @override
  final Size preferredSize;
}
