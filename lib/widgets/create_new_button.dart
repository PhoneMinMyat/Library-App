import 'package:flutter/material.dart';
import 'package:library_app/resources/dimens.dart';

class CreateNewButton extends StatelessWidget {
  final Function onTap;
  final String text;
  const CreateNewButton(
    this.onTap, {required this.text,
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
            children:  [
             const Icon(
                Icons.edit,
                color: Colors.white,
              ),
              Text(
                text,
                style:const TextStyle(color: Colors.white),
              )
            ],
          ),
        ));
  }
}
