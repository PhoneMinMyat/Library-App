import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/book_details_page.dart';
import 'package:library_app/widget_keys.dart';

import '../test_data/test_data.dart';

class BookDetailsPageRobot {
  final WidgetTester tester;
  BookDetailsPageRobot(
    this.tester,
  );

  Future<void> checkBookDetailsPageItemAndReturn(
      String bookTitle, String authorName) async {
    expect(find.byType(BookDetailsPage), findsOneWidget);

    // expect(find.text(bookTitle), findsOneWidget);
    // expect(find.text(authorName), findsOneWidget);
    expect(find.byKey(const Key(KEY_DETAILS_PAGE_TITLE_AND_AUTHOR_SECTION)),
        findsOneWidget);

    expect(find.text(TEST_DATA_ABOUT_THIS_BOOK), findsOneWidget);

    await tester.dragUntilVisible(find.text(TEST_DATA_SIMILAR_EBOOKS),
        find.text(TEST_DATA_SIMILAR_EBOOKS), const Offset(0, 600));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.text(TEST_DATA_SIMILAR_EBOOKS), findsOneWidget);

      expect(find.byKey(const Key(KEY_BOOK_DETAILS_PAGE_BACK_BUTOON)),
        findsOneWidget);

    await tester.tap(
        find.byKey(const Key(KEY_BOOK_DETAILS_PAGE_BACK_BUTOON)));

    await tester.pumpAndSettle(const Duration(seconds: 2));
  }
}
