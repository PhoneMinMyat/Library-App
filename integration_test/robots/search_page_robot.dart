import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/search_page.dart';
import 'package:library_app/widget_keys.dart';

import '../test_data/test_data.dart';

class SearchPageRobot {
  final WidgetTester tester;
  SearchPageRobot(this.tester);

  Future<void> checkSearchPageItems() async {
    expect(find.text(TEST_DATA_TOP_SELLING), findsOneWidget);
    //expect(find.text(TEST_DATA_SEARCH_TITILE), findsOneWidget);
  }

  Future<void> searchBookAndCheck() async {
    expect(find.byKey(const Key(KEY_SEARCH_TEXT_FIELD)), findsOneWidget);
    // await tester.tap(find.byKey(const Key(KEY_SEARCH_TEXT_FIELD)));

    await tester.pumpAndSettle(const Duration(seconds: 3));

    await tester.enterText(
        find.byKey(const Key(KEY_SEARCH_TEXT_FIELD)), TEST_DATA_SEARCH_TEXT);

    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.byKey(const Key(KEY_SEARCH_SUGGEST_BOOK_LIST)), findsOneWidget);
    expect(find.text(TEST_DATA_SEARCH_RESULT_BOOK_NAME), findsOneWidget);
  }

  Future<void> tapResultBook() async {
    await tester.tap(find.text(TEST_DATA_SEARCH_RESULT_BOOK_NAME));

    await tester.pumpAndSettle(const Duration(seconds: 5));
  }

  Future<void> tapSearchButtonAndCheck() async {
    expect(find.byKey(const Key(KEY_SEARCH_ICON_BUTTON)), findsOneWidget);

    await tester.tap(find.byKey(const Key(KEY_SEARCH_ICON_BUTTON)));

    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.byKey(const Key(KEY_SEARCH_RESULT_BOOK_VIEW)), findsOneWidget);

    expect(find.text(TEST_DATA_COMPUTERS), findsOneWidget);

    expect(
        find.byKey(
            const Key(TEST_DATA_COMPUTERS + TEST_DATA_SEARCH_RESULT_BOOK_NAME)),
        findsOneWidget);

    await tester.tap(find.byKey(
        const Key(TEST_DATA_COMPUTERS + TEST_DATA_SEARCH_RESULT_BOOK_NAME)));

    await tester.pumpAndSettle(const Duration(seconds: 5));
  }

  Future<void> onTapBack() async {
    await tester.tap(find.byKey(const Key(KEY_SEARCH_PAGE_BACK_BUTTON)));

    await tester.pumpAndSettle(const Duration(seconds: 5));
  }

  Future<void> isSearchPage() async {
    expect(find.byType(SearchPage), findsOneWidget);
  }
}
