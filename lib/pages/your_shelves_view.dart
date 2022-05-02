import 'package:flutter/material.dart';
import 'package:library_app/data/vos/shelve_vo.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';
import 'package:library_app/viewitems/book_shelves_colletion_list_item.dart';

class YourShelvesView extends StatelessWidget {
  final Function onTapShelvesList;
  final Function onTapCreateNewShelve;
  final List<ShelveVO> shelveList;
  const YourShelvesView(
    this.onTapShelvesList, {
    required this.shelveList,
    required this.onTapCreateNewShelve,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: shelveList.length,
            itemBuilder: (context, index) {
              return BookShelvesCollectionListItem(
                () {
                  onTapShelvesList();
                },
                shelve: shelveList[index],
              );
            },
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: MARGIN_MEDIUM_2x),
              child: CreateNewButton(() {
                onTapCreateNewShelve();
              }),
            ))
      ],
    );
  }
}

class CreateNewButton extends StatelessWidget {
  final Function onTap;
  const CreateNewButton(
    this.onTap, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          height: CREATE_NEW_SHELVES_BUTTON_HEIGHT,
          width: CREATE_NEW_SHELVES_BUTTON_WIDTH,
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.edit,
                color: Colors.white,
              ),
              Text(
                CREATE_NEW,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ));
  }
}
