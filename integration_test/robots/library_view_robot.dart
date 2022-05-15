import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/library_view.dart';

import '../test_data/test_data.dart';

class LibraryViewRobot {
  final WidgetTester tester;
  LibraryViewRobot(this.tester);

  Future<void> isLibraryView() async {
    expect(find.byType(LibraryView), findsOneWidget);
    expect(find.text(TEST_DATA_LIBRARY_YOUR_BOOK), findsOneWidget);
    expect(find.text(TEST_DATA_LIBRARY_YOUR_SHELVES), findsOneWidget);
  }

  Future<void> changeShelfView() async {
    expect(find.text(TEST_DATA_LIBRARY_YOUR_SHELVES), findsOneWidget);

    await tester.tap(find.text(TEST_DATA_LIBRARY_YOUR_SHELVES));
    await tester.pumpAndSettle(const Duration(seconds: 3));
  }

  Future<void> changeLibraryView() async {
    expect(find.text(TEST_DATA_LIBRARY_YOUR_BOOK), findsOneWidget);

    await tester.tap(find.text(TEST_DATA_LIBRARY_YOUR_BOOK));
    await tester.pumpAndSettle(const Duration(seconds: 3));
  }
}
