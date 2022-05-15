import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/your_book_view.dart';
import 'package:library_app/widget_keys.dart';

import '../test_data/test_data.dart';

class YourBookViewRobot {
  final WidgetTester tester;
  YourBookViewRobot(this.tester);

  Future<void> changeViewTest() async {
    expect(find.byKey(const Key(KEY_CHANGE_VIEW_BUTTON)), findsOneWidget);

    await tester.tap(find.byKey(const Key(KEY_CHANGE_VIEW_BUTTON)));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.byKey(const Key(KEY_RESUABLE_GRIDVIEW_LARGE)), findsOneWidget);

    await tester.tap(find.byKey(const Key(KEY_CHANGE_VIEW_BUTTON)));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.byKey(const Key(KEY_RESUABLE_GRIDVIEW_SMALL)), findsOneWidget);

    await tester.tap(find.byKey(const Key(KEY_CHANGE_VIEW_BUTTON)));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.byKey(const Key(KEY_RESUABLE_LISTVIEW)), findsOneWidget);
  }

  Future<void> isYourBookView() async {
    expect(find.byType(YourBooksView), findsOneWidget);
    expect(find.byKey(const Key(KEY_RESUABLE_BOOK_LIST)), findsOneWidget);
  }

  Future<void> onTapBookSeeMoreAndAddToShelf() async {
    expect(find.byKey(const Key(TEST_DATA_BOOK_NAME_TWO + KEY_SEE_MORE_BUTTON)),
        findsOneWidget);
    await tester.tap(
        find.byKey(const Key(TEST_DATA_BOOK_NAME_TWO + KEY_SEE_MORE_BUTTON)));
    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(find.byKey(const Key(KEY_BOOK_MORE_MODAL_BOTTOM)), findsOneWidget);
    expect(find.byKey(const Key(KEY_ADD_TO_SHELF)), findsOneWidget);

    await tester.tap(find.byKey(const Key(KEY_ADD_TO_SHELF)));
    await tester.pumpAndSettle(const Duration(seconds: 3));
  }

  Future<void> onTapBookItem() async {
    await tester.tap(find.text(TEST_DATA_BOOK_NAME_TWO));
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }
}
