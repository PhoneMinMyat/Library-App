import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/your_shelves_view.dart';
import 'package:library_app/widget_keys.dart';

import '../test_data/test_data.dart';

class YourShelfViewRobot {
  final WidgetTester tester;
  YourShelfViewRobot(this.tester);

  Future<void> isYourShelfView() async {
    expect(find.byType(YourShelvesView), findsOneWidget);
    expect(find.text(TEST_DATA_CREATE_NEW_BUTTON), findsOneWidget);
  }

  Future<void> tapAddNewShelf() async {
    expect(find.text(TEST_DATA_CREATE_NEW_BUTTON), findsOneWidget);
    await tester.tap(find.text(TEST_DATA_CREATE_NEW_BUTTON));

    await tester.pumpAndSettle(const Duration(seconds: 3));
  }

  Future<void> checkShelfList() async{
    expect(find.byKey(const Key(KEY_SHELF_LIST_VIEW)), findsOneWidget);
  }
  
  Future<void> checkShelfListClear() async{
    expect(find.byKey(const Key(KEY_SHELF_LIST_VIEW)), findsNothing);
  }

  Future<void> tapShelf() async{
    expect(find.text(TEST_DATA_CREATE_NEW_SHELF_NAME), findsOneWidget);

    await tester.tap(find.text(TEST_DATA_CREATE_NEW_SHELF_NAME));

    await tester.pumpAndSettle(const Duration(seconds: 3));
  }
}
