import 'package:flutter/material.dart';
import 'package:library_app/bloc/add_book_to_shelf_page_bloc.dart';
import 'package:library_app/data/vos/shelf_vo.dart';
import 'package:library_app/pages/add_new_shelf_page.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';
import 'package:library_app/viewitems/book_shelves_colletion_list_item.dart';
import 'package:library_app/viewitems/empty_book_view.dart';
import 'package:library_app/widgets/create_new_button.dart';
import 'package:provider/provider.dart';

class AddBookToShelfPage extends StatefulWidget {
  final String bookId;
  const AddBookToShelfPage({required this.bookId, Key? key}) : super(key: key);

  @override
  State<AddBookToShelfPage> createState() => _AddBookToShelfPageState();
}

class _AddBookToShelfPageState extends State<AddBookToShelfPage> {
  AddBookToShelfPageBloc? _bloc;

  @override
  void initState() {
    _bloc = AddBookToShelfPageBloc(widget.bookId);
    super.initState();
  }

  @override
  void dispose() {
    _bloc?.makeDispose();
    super.dispose();
  }

  void onTapCreateNewShelf() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddNewShelfPage(
          bookId: widget.bookId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _bloc,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              color: Colors.black54,
              size: MARGIN_XLARGE,
            ),
          ),
          automaticallyImplyLeading: false,
          title: const Text(
            ADD_TO_SHELF_TITLE,
            style: TextStyle(color: Colors.black54),
          ),
        ),
        body: Stack(children: [
          Selector<AddBookToShelfPageBloc, List<ShelfVO>?>(
            selector: (contex, bloc) => bloc.shelveList,
            shouldRebuild: (previous, next) => previous != next,
            builder: (context, shelveList, child) =>
                (shelveList == null || shelveList.isEmpty)
                    ? const EmptyBookView(
                        isYourShelfView: true,
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: shelveList.length,
                        itemBuilder: (context, index) {
                          return BookShelvesCollectionListItem(
                            () {
                              AddBookToShelfPageBloc bloc =
                                  Provider.of<AddBookToShelfPageBloc>(context,
                                      listen: false);
                              bloc.addBook(shelveList[index].id ?? 0);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            shelve: shelveList[index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: MARGIN_MEDIUM,
                        ),
                      ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: MARGIN_MEDIUM_2x),
                child: CreateNewButton(
                  () {
                    onTapCreateNewShelf();
                  },
                  text: ADD_NEW_SHELF,
                ),
              ))
        ]),
      ),
    );
  }
}
