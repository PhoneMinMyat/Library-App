import 'package:flutter/material.dart';
import 'package:library_app/bloc/collection_details_bloc.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/pages/book_details_page.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/viewitems/book_view_item.dart';
import 'package:library_app/viewitems/empty_book_view.dart';
import 'package:library_app/widget_keys.dart';
import 'package:provider/provider.dart';

class BookCollectionDetailsPage extends StatefulWidget {
  final String titleName;
  const BookCollectionDetailsPage({
    Key? key,
    required this.titleName,
  }) : super(key: key);

  @override
  State<BookCollectionDetailsPage> createState() =>
      _BookCollectionDetailsPageState();
}

class _BookCollectionDetailsPageState extends State<BookCollectionDetailsPage> {
  CollectionDetailsBloc? _bloc;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _bloc = CollectionDetailsBloc(widget.titleName);
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print('Start reached');
        } else {
          print('End reached');
          _bloc?.onBookListReachedEnd();
        }
      }
    });
    super.initState();
  }

  void onTapBookItem(BuildContext context, String bookId) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BookDetailsPage(
              bookId: bookId,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _bloc,
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.white.withOpacity(0.96),
        appBar: CustomAppBarForCollectionDetails(titleName: widget.titleName),
        body: Selector<CollectionDetailsBloc, List<BookVO>?>(
          selector: (context, bloc) => bloc.bookList,
          builder: (context, bookList, child) => (bookList == null)
              ? const Center(child: CircularProgressIndicator())
              : (bookList.isNotEmpty)
                  ? GridView.builder(
                      key: const Key(KEY_BOOK_MORE_LIST_VIEW),
                      controller: _scrollController,
                      padding: const EdgeInsets.all(MARGIN_MEDIUM_2x),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: MARGIN_MEDIUM_2x,
                              crossAxisSpacing: MARGIN_MEDIUM,
                              crossAxisCount: 2,
                              childAspectRatio: 1.5 / 2),
                      shrinkWrap: true,
                      itemCount: bookList.length,
                      itemBuilder: (context, index) {
                        return BookViewItem(
                          (bookId) {
                            onTapBookItem(context, bookId);
                          },
                          book: bookList[index],
                        );
                      })
                  : const EmptyBookView(
                      isSearchView: true,
                    ),
        ),
      ),
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
      backgroundColor: Colors.white.withOpacity(0.96),
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
          key: Key(KEY_BOOK_COLLECTION_DETAILS_PAGE_BACK_BUTOON),
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
