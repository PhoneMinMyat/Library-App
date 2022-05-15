import 'package:flutter/material.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';

class SortModalBottomSheetView extends StatelessWidget {
  final int radioVal;
  final Function(int) tapRadioButton;
  const SortModalBottomSheetView({
    Key? key,
    required this.radioVal,
    required this.tapRadioButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3x, vertical: MARGIN_MEDIUM_2x),
          child: Text(
            SORT_BY,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: TEXT_REGULAR_2x),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black54, width: 0.5),
            ),
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        ListTile(
          title: const Text(SORT_BY_RECENT),
          leading: Radio(
            value: 0,
            groupValue: radioVal,
            onChanged: (value) {
              tapRadioButton(value as int);
              Navigator.pop(context);
            },
            activeColor: Colors.blue,
          ),
        ),
        ListTile(
          title: const Text(SORT_BY_TITLE),
          leading: Radio(
            value: 1,
            groupValue: radioVal,
            onChanged: (value) {
              tapRadioButton(value as int);
              Navigator.pop(context);
            },
            activeColor: Colors.blue,
          ),
        ),
        ListTile(
          title: const Text(SORT_BY_AUTHOR),
          leading: Radio(
            value: 2,
            groupValue: radioVal,
            onChanged: (value) {
              tapRadioButton(value as int);
              Navigator.pop(context);
            },
            activeColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}
