import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/widget_keys.dart';

import '../test_data/test_data.dart';

class AddNewShelfPageRobot {
  final WidgetTester tester;
  AddNewShelfPageRobot(this.tester);

  Future<void> isAddNewShelfPage() async {
    expect(find.byKey(const Key(KEY_ADD_NEW_SHELF_TEXT_FIELD)), findsOneWidget);
    expect(find.byKey(const Key(KEY_CONFIRM_ADD_NEW_SHELF)), findsOneWidget);
  }

  Future<void> createNewShelf() async {
    await tester.enterText(find.byKey(const Key(KEY_ADD_NEW_SHELF_TEXT_FIELD)),
        TEST_DATA_CREATE_NEW_SHELF_NAME);

    await tester.pumpAndSettle(const Duration(seconds: 3));

    await tester.tap(find.byKey(const Key(KEY_CONFIRM_ADD_NEW_SHELF)));

    await tester.pumpAndSettle(const Duration(seconds: 3));
  }
}
