import 'package:flutter/material.dart';
import 'package:library_app/bloc/your_shelves_view_bloc.dart';
import 'package:library_app/data/vos/shelf_vo.dart';
import 'package:library_app/pages/add_new_shelf_page.dart';
import 'package:library_app/pages/shelves_details_page.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';
import 'package:library_app/viewitems/book_shelves_colletion_list_item.dart';
import 'package:library_app/viewitems/empty_book_view.dart';
import 'package:library_app/widget_keys.dart';
import 'package:library_app/widgets/create_new_button.dart';
import 'package:provider/provider.dart';

class YourShelvesView extends StatefulWidget {
  const YourShelvesView({
    Key? key,
  }) : super(key: key);

  @override
  State<YourShelvesView> createState() => _YourShelvesViewState();
}

class _YourShelvesViewState extends State<YourShelvesView> {
  final YourShelvesViewBloc _bloc = YourShelvesViewBloc();

  void onTapCreateShelve() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AddNewShelfPage()));
  }

  void onTapShelvesList(int shelvesId) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ShelvesDetailsPage(
              shelvesId: shelvesId,
            )));
  }

  @override
  void dispose() {
    _bloc.makeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _bloc,
      builder: (context, child) => Stack(
        children: [
          Positioned.fill(
            child: Selector<YourShelvesViewBloc, List<ShelfVO>?>(
              selector: (contex, bloc) => bloc.shelveList,
              shouldRebuild: (previous, next) => previous != next,
              builder: (context, shelveList, child) =>
                  (shelveList == null || shelveList.isEmpty)
                      ? const EmptyBookView(
                          isYourShelfView: true,
                        )
                      : ListView.separated(
                          key: const Key(KEY_SHELF_LIST_VIEW),
                          shrinkWrap: true,
                          itemCount: shelveList.length,
                          itemBuilder: (context, index) {
                            return BookShelvesCollectionListItem(
                              () {
                                onTapShelvesList(shelveList[index].id ?? 0);
                              },
                              shelve: shelveList[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: MARGIN_MEDIUM,
                          ),
                        ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: MARGIN_MEDIUM_2x),
                child: CreateNewButton(
                  () {
                    onTapCreateShelve();
                  },
                  text: CREATE_NEW,
                ),
              ))
        ],
      ),
    );
  }
}
