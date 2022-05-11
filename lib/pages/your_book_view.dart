import 'package:flutter/material.dart';
import 'package:library_app/bloc/your_book_view_bloc.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/pages/book_details_page.dart';
import 'package:library_app/viewitems/book_more_bottom_modal_sheet_view.dart';
import 'package:library_app/viewitems/empty_book_view.dart';
import 'package:library_app/viewitems/reuseable_book_library_view.dart';
import 'package:library_app/viewitems/sort_model_bottom_sheet_view.dart';
import 'package:provider/provider.dart';

class YourBooksView extends StatefulWidget {
  const YourBooksView({
    Key? key,
  }) : super(key: key);

  @override
  State<YourBooksView> createState() => _YourBooksViewState();
}

class _YourBooksViewState extends State<YourBooksView> {
  YourBookViewBloc? _bloc;

  @override
  void initState() {
    _bloc = YourBookViewBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc?.makeDispose();
    super.dispose();
  }

  void onTapBookMore(BookVO book) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BookMoreModalBottomSheetView(
            book: book,
          );
        });
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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => _bloc,
        builder: (context, child) => Consumer<YourBookViewBloc>(
              builder: (context, bloc, child) =>
                  (bloc.yourBookList?.isNotEmpty ?? false)
                      ? ReuseableBookLibrayView(
                          bookList: bloc.yourBookList ?? [],
                          onTapBook: (bookId) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    BookDetailsPage(bookId: bookId)));
                          },
                          onTapBookSeeMore: (book) {
                            onTapBookMore(book);
                          },
                          chipList: bloc.categoryChipList ?? [],
                          onTapChip: (selectedId) {
                            YourBookViewBloc _bloc =
                                Provider.of<YourBookViewBloc>(context,
                                    listen: false);
                            _bloc.onTapChip(selectedId);
                          },
                          onTapChipCancel: () {
                            YourBookViewBloc _bloc =
                                Provider.of<YourBookViewBloc>(context,
                                    listen: false);
                            _bloc.onTapChipCancel();
                          },
                          sortedType: bloc.sortedType,
                          onChangeSort: () {
                            onTapChangeSort();
                          },
                          viewType: bloc.viewType,
                          onChangeView: () {
                            YourBookViewBloc _bloc =
                                Provider.of<YourBookViewBloc>(context,
                                    listen: false);
                            _bloc.onTapChangeView();
                          },
                        )
                      : const EmptyBookView(),
            ));
  }
}
