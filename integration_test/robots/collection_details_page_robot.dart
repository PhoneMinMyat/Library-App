import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/book_collection_details_page.dart';
import 'package:library_app/widget_keys.dart';

import '../test_data/test_data.dart';

class CollectionDetailsPageRobot{
  final WidgetTester tester;
  CollectionDetailsPageRobot(this.tester);

  Future<void> checkCollectionDetailsPageAndBack() async{
    expect(find.text(TEST_DATA_HARDCOVER_FICTION), findsOneWidget);

    expect(find.byKey(const Key(KEY_BOOK_MORE_LIST_VIEW)), findsOneWidget);
    expect(find.byKey(const Key(KEY_BOOK_COLLECTION_DETAILS_PAGE_BACK_BUTOON)), findsOneWidget);
    
    await tester.tap(find.byKey(const Key(KEY_BOOK_COLLECTION_DETAILS_PAGE_BACK_BUTOON)));

    await tester.pumpAndSettle(const Duration(seconds: 5));
  }

  Future<void> isCollectionDetailsPage() async{
    expect(find.byType(BookCollectionDetailsPage), findsOneWidget);
  }
}