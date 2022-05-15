import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/home_page.dart';
import 'package:library_app/pages/home_view.dart';
import 'package:library_app/widget_keys.dart';

import '../test_data/test_data.dart';

class HomeViewRobot {
  final WidgetTester tester;

  const HomeViewRobot(this.tester);

  Future<void> findHomePageItemsAndTapBook() async {
    expect(find.byType(HomePage), findsOneWidget);

    expect(find.byType(HomeView), findsOneWidget);

    //expect(find.text(TEST_DATA_BOOK_NAME_ONE), findsOneWidget);
    expect(
        find.byKey(
            const Key(TEST_DATA_HARDCOVER_FICTION + TEST_DATA_BOOK_NAME_TWO)),
        findsOneWidget);
    expect(find.text(TEST_DATA_HARDCOVER_FICTION), findsOneWidget);
    expect(find.text(TEST_DATA_SEARCH_TITILE), findsOneWidget);
    expect(find.byKey(const Key(KEY_CAROUSEL_SECTION)), findsNothing);

    await tester.tap(find.text(TEST_DATA_BOOK_NAME_TWO));

    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> checkCarouselAndTap() async {
    expect(find.byKey(const Key(KEY_CAROUSEL_SECTION)), findsOneWidget);

    await tester.tap(find.byKey(const Key(KEY_CAROUSEL_ITEM + '0')));
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> isHomeViewPage() async {
    expect(find.byType(HomePage), findsOneWidget);

    expect(find.byType(HomeView), findsOneWidget);
  }

  Future<void> tapMoreCollection() async {
    expect(find.text(TEST_DATA_HARDCOVER_FICTION), findsOneWidget);
    await tester.tap(find.text(TEST_DATA_HARDCOVER_FICTION));

    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> tapSearch() async {
    expect(find.text(TEST_DATA_SEARCH_TITILE), findsOneWidget);
    await tester.tap(find.text(TEST_DATA_SEARCH_TITILE));

    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> changeLibraryView() async {
    expect(find.byKey(const Key(KEY_HOME_PAGE_BOTTOM_NAVIAGATION_BAR_LIBRARY)),
        findsOneWidget);

    await tester.tap(
        find.byKey(const Key(KEY_HOME_PAGE_BOTTOM_NAVIAGATION_BAR_LIBRARY)));

    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> changeHomeView() async{
     expect(find.byKey(const Key(KEY_HOME_PAGE_BOTTOM_NAVIAGATION_BAR_HOME)),
        findsOneWidget);

    await tester.tap(
        find.byKey(const Key(KEY_HOME_PAGE_BOTTOM_NAVIAGATION_BAR_HOME)));

    await tester.pumpAndSettle(const Duration(seconds: 2));
  }
}
