import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/shelves_details_page.dart';
import 'package:library_app/widget_keys.dart';

import '../test_data/test_data.dart';

class ShelvesDetailsPageRobot {
  final WidgetTester tester;
  ShelvesDetailsPageRobot(this.tester);

  Future<void> isShelvesDetailsPage() async {
    expect(find.byType(ShelvesDetailsPage), findsOneWidget);

    expect(find.text(TEST_DATA_CREATE_NEW_SHELF_NAME), findsOneWidget);

    expect(find.byKey(const Key(KEY_SHELF_BOOK_LIST_VIEW)), findsOneWidget);
  }

  Future<void> renameShelf() async {
    expect(find.byKey(const Key(KEY_SHELF_DETAILS_POPUP_MENU_BUTTON)),
        findsOneWidget);

    await tester
        .tap(find.byKey(const Key(KEY_SHELF_DETAILS_POPUP_MENU_BUTTON)));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.byKey(const Key(KEY_SHELF_DETAILS_RENAME)), findsOneWidget);

    await tester.tap(find.byKey(const Key(KEY_SHELF_DETAILS_RENAME)));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.byKey(const Key(KEY_SHELF_DETAILS_TEXT_FIELD)), findsOneWidget);

    await tester.enterText(find.byKey(const Key(KEY_SHELF_DETAILS_TEXT_FIELD)),
        TEST_DATA_EDIT_NEW_SHELF);

    await tester.testTextInput.receiveAction(TextInputAction.done);

    expect(find.text(TEST_DATA_EDIT_NEW_SHELF), findsOneWidget);
  }

  Future<void> deleteShelf() async {
    expect(find.byKey(const Key(KEY_SHELF_DETAILS_POPUP_MENU_BUTTON)),
        findsOneWidget);

    await tester
        .tap(find.byKey(const Key(KEY_SHELF_DETAILS_POPUP_MENU_BUTTON)));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.byKey(const Key(KEY_SHELF_DETAILS_DELETE)), findsOneWidget);

    await tester.tap(find.byKey(const Key(KEY_SHELF_DETAILS_DELETE)));
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }
}
