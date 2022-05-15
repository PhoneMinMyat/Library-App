import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/add_book_to_shelf_page.dart';

import '../test_data/test_data.dart';

class AddBookToShelfPageRobot{
  final WidgetTester tester;
  AddBookToShelfPageRobot(this.tester);

  Future<void> isAddBookToShelfPage() async{
    expect(find.byType(AddBookToShelfPage), findsOneWidget);
    expect(find.text(TEST_DATA_ADD_NEW_SHELF_BUTTON), findsOneWidget);
    expect(find.text(TEST_DATA_CREATE_NEW_SHELF_NAME), findsOneWidget);
  }

  Future<void> addToShelf() async{

    expect(find.text(TEST_DATA_CREATE_NEW_SHELF_NAME), findsOneWidget);
    await tester.tap(find.text(TEST_DATA_CREATE_NEW_SHELF_NAME));
    await tester.pumpAndSettle(const Duration(seconds: 3));
  }
}