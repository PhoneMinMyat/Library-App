import 'package:flutter/material.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';

class AddNewShelfPage extends StatelessWidget {
  const AddNewShelfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.check,
            color: Colors.blue,
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
            child: TextField(
              style: TextStyle(fontSize: TEXT_HEADING),
              maxLines: 2,
              decoration: InputDecoration(
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
          )
        ],
      ),
    );
  }
}
