import 'package:flutter/material.dart';
import 'package:library_app/bloc/shelves_details_page_bloc.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/pages/book_details_page.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';
import 'package:library_app/viewitems/book_more_bottom_modal_sheet_view.dart';
import 'package:library_app/viewitems/reuseable_book_library_view.dart';
import 'package:library_app/viewitems/sort_model_bottom_sheet_view.dart';
import 'package:library_app/widget_keys.dart';
import 'package:provider/provider.dart';

class ShelvesDetailsPage extends StatefulWidget {
  final int shelvesId;
  const ShelvesDetailsPage({required this.shelvesId, Key? key})
      : super(key: key);

  @override
  State<ShelvesDetailsPage> createState() => _ShelvesDetailsPageState();
}

class _ShelvesDetailsPageState extends State<ShelvesDetailsPage> {
  ShelvesDetailsPageBloc? _bloc;

  @override
  void initState() {
    _bloc = ShelvesDetailsPageBloc(widget.shelvesId);
    super.initState();
  }

  @override
  void dispose() {
    _bloc?.makeDispose();
    super.dispose();
  }

  void onTapChangeSort() {
    int radioValue = _bloc?.sortedType.index ?? 0;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SortModalBottomSheetView(
              radioVal: radioValue,
              tapRadioButton: (radioValue) {
                _bloc?.changeSort(radioValue);
              });
        });
  }

  void onTapBookItem(String bookId) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BookDetailsPage(
              bookId: bookId,
            )));
  }

  void onTapDeleteShelf() async {
    await Future.delayed(const Duration(milliseconds: 500));
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        key: const Key(KEY__SHELF_DELETE_ALERT_DIALOG),
        title: const Text(DELETE_SHELF),
        content: const Text(DELETE_SHELF_CONTENT),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(CANCEL),
          ),
          GestureDetector(
            onTap: () {
              _bloc?.deleteShelf();
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text(
              CONFIRM,
              key: Key(KEY__SHELF_DELETE_ALERT_DIALOG_CONFIRM),
            ),
          ),
        ],
        actionsPadding: const EdgeInsets.all(MARGIN_MEDIUM_2x),
      ),
    );
  }

  void onTapDeleteBook() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(DELETE_FROM_LIB),
              content: const Text(CONFIRM_DELETE_BOOK),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(CANCEL),
                ),
                GestureDetector(
                  onTap: () {
                    print('Confirm');
                    Navigator.pop(context);
                  },
                  child: const Text(CONFIRM),
                ),
              ],
              actionsPadding: const EdgeInsets.all(MARGIN_MEDIUM_2x),
            ));
  }

  void onTapBookMore(BookVO book) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BookMoreModalBottomSheetView(
            book: book,
            isYourBookView: false,
            addToShelf: (bookId) {
              _bloc?.removeBookFromShelf(bookId);
              Navigator.pop(context);
            },
            deleteFromLibrary: (bookId) {
              // onTapDeleteBook(bookId);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _bloc,
      builder: (context, child) => Consumer<ShelvesDetailsPageBloc>(
        builder: (context, bloc, child) {
          String tempText = '';
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBarForShelves(
              onTapRename: () {
                ShelvesDetailsPageBloc bloc =
                    Provider.of<ShelvesDetailsPageBloc>(context, listen: false);
                bloc.onTapRename();
              },
              onTapDelete: () {
                onTapDeleteShelf();
              },
              confimEdit: () {
                print('confirm edit');
                ShelvesDetailsPageBloc bloc =
                    Provider.of<ShelvesDetailsPageBloc>(context, listen: false);
                bloc.renameShelf(tempText);
              },
              isEditing: bloc.isEditing,
            ),
            body: Column(
              children: [
                TitleSectionView(
                  title: bloc.shelfTitle ?? '',
                  bookCounts:
                      (bloc.allBookListFromShelf?.length ?? 0).toString(),
                  isEditing: bloc.isEditing,
                  onChange: (newValue) {
                    tempText = newValue;
                  },
                  onSubmitted: (inputText) {
                    ShelvesDetailsPageBloc bloc =
                        Provider.of<ShelvesDetailsPageBloc>(context,
                            listen: false);
                    bloc.renameShelf(inputText);
                  },
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM_2x,
                ),
                Expanded(
                    child: ReuseableBookLibrayView(
                  key: const Key(KEY_SHELF_BOOK_LIST_VIEW),
                  bookList: bloc.bookListFromShelf ?? [],
                  onTapBook: (bookId) {
                    onTapBookItem(bookId);
                  },
                  onTapBookSeeMore: (book) {
                    onTapBookMore(book);
                  },
                  chipList: bloc.categoryChipList ?? [],
                  onTapChip: (selectedId) {
                    ShelvesDetailsPageBloc bloc =
                        Provider.of<ShelvesDetailsPageBloc>(context,
                            listen: false);
                    bloc.onTapChip(selectedId);
                  },
                  onTapChipCancel: () {
                    ShelvesDetailsPageBloc bloc =
                        Provider.of<ShelvesDetailsPageBloc>(context,
                            listen: false);
                    bloc.onTapChipCancel();
                  },
                  sortedType: bloc.sortedType,
                  onChangeSort: () {
                    onTapChangeSort();
                  },
                  viewType: bloc.viewType,
                  onChangeView: () {
                    ShelvesDetailsPageBloc bloc =
                        Provider.of<ShelvesDetailsPageBloc>(context,
                            listen: false);
                    bloc.onTapChangeView();
                  },
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}

class TitleSectionView extends StatelessWidget {
  final String title;
  final String bookCounts;
  final Function(String) onSubmitted;
  final bool isEditing;
  final Function(String) onChange;
  const TitleSectionView({
    required this.title,
    required this.bookCounts,
    required this.onSubmitted,
    required this.isEditing,
    required this.onChange,
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
        children: [
          (isEditing)
              ? TextFormField(
                  key: const Key(KEY_SHELF_DETAILS_TEXT_FIELD),
                  autofocus: isEditing,
                  //readOnly: !isEditing,
                  decoration: const InputDecoration(border: InputBorder.none),
                  initialValue: title,
                  onFieldSubmitted: (inputText) {
                    onSubmitted(inputText);
                  },
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: TEXT_HEADING_2X,
                      color: Colors.black87),
                  onChanged: (newValue) {
                    onChange(newValue);
                  },
                )
              : Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: TEXT_HEADING_2X,
                      color: Colors.black87),
                ),
          const SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Text(
            '$bookCounts books',
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class CustomAppBarForShelves extends StatelessWidget
    implements PreferredSizeWidget {
  final Function onTapRename;
  final Function onTapDelete;
  final Function confimEdit;
  final bool isEditing;
  const CustomAppBarForShelves({
    required this.onTapDelete,
    required this.onTapRename,
    required this.confimEdit,
    required this.isEditing,
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
          (isEditing)
              ? () {
                  print('confim from Appbar');
                  confimEdit();
                }
              : Navigator.pop(context);
        },
        child: Icon(
          (isEditing) ? Icons.check : Icons.chevron_left,
          color: Colors.grey,
          size: MARGIN_XLARGE,
          key: const Key(KEY_SHELF_DETAILS_PAGE_BACK_BUTTON),
        ),
      ),
      actions: [
        PopupMenuButton(
            child: const Icon(
              Icons.more_horiz,
              color: Colors.grey,
              size: MARGIN_XLARGE,
              key: Key(KEY_SHELF_DETAILS_POPUP_MENU_BUTTON),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  key: const Key(KEY_SHELF_DETAILS_RENAME),
                  child: const Text('Rename shelf'),
                  onTap: () {
                    onTapRename();
                  },
                ),
                PopupMenuItem(
                  key: const Key(KEY_SHELF_DETAILS_DELETE),
                  child: const Text('Delete shelf'),
                  onTap: () {
                    onTapDelete();
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
