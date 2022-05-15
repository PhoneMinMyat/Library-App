import 'package:flutter/material.dart';
import 'package:library_app/bloc/add_new_shelf_page_bloc.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';
import 'package:library_app/viewitems/book_list_view_item.dart';
import 'package:library_app/widget_keys.dart';
import 'package:provider/provider.dart';

class AddNewShelfPage extends StatefulWidget {
  final String bookId;
  const AddNewShelfPage({this.bookId = '', Key? key}) : super(key: key);

  @override
  State<AddNewShelfPage> createState() => _AddNewShelfPageState();
}

class _AddNewShelfPageState extends State<AddNewShelfPage> {
  String inputText = '';
  AddNewShelfPageBloc? addNewShelfPageBloc;

  @override
  void initState() {
    addNewShelfPageBloc = AddNewShelfPageBloc(widget.bookId);
    super.initState();
  }

  @override
  void dispose() {
    addNewShelfPageBloc?.makeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddNewShelfPageBloc>(
      create: (context) =>
          addNewShelfPageBloc ?? AddNewShelfPageBloc(widget.bookId),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              if (inputText.isNotEmpty) {
                AddNewShelfPageBloc _bloc =
                    Provider.of<AddNewShelfPageBloc>(context, listen: false);
                _bloc.saveShelf(inputText);
                Navigator.pop(context);
              } else {
                Navigator.pop(context);
              }
            },
            child: const Icon(
              Icons.check,
              key: Key(KEY_CONFIRM_ADD_NEW_SHELF),
              color: Colors.blue,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
              child: TextField(
                key: const Key(KEY_ADD_NEW_SHELF_TEXT_FIELD),
                style: const TextStyle(fontSize: TEXT_HEADING),
                onSubmitted: (inputText) {
                  AddNewShelfPageBloc _bloc =
                      Provider.of<AddNewShelfPageBloc>(context, listen: false);
                  _bloc.saveShelf(inputText);
                  Navigator.pop(context);
                },
                onChanged: (newValue) {
                  inputText = newValue;
                },
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: SHELF_NAME,
                  hintStyle: TextStyle(fontSize: TEXT_HEADING),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: MARGIN_XLARGE,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black54, width: 0.5))),
            ),
            const SizedBox(
              height: MARGIN_XLARGE,
            ),
            (widget.bookId.isEmpty)
                ? Container()
                : Selector<AddNewShelfPageBloc, BookVO?>(
                    selector: (context, bloc) => bloc.selectedBook,
                    builder: (context, selectedBook, child) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: MARGIN_MEDIUM_2x),
                          child: BookListItem(
                              onTapBook: (bookId) {},
                              onTapBookSeeMore: (bookId) {},
                              book: selectedBook ?? BookVO()),
                        ))
          ],
        ),
      ),
    );
  }
}
