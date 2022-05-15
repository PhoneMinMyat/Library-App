import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:integration_test/integration_test.dart';
import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/buy_link_vo.dart';
import 'package:library_app/data/vos/overview_vo.dart';
import 'package:library_app/data/vos/shelf_vo.dart';
import 'package:library_app/main.dart';
import 'package:library_app/persistence/hive_constants.dart';

import 'robots/add_book_to_shelf_page_robot.dart';
import 'robots/add_new_shelf_page_robot.dart';
import 'robots/book_details_page_robot.dart';
import 'robots/collection_details_page_robot.dart';
import 'robots/home_view_robot.dart';
import 'robots/library_view_robot.dart';
import 'robots/search_page_robot.dart';
import 'robots/shelves_details_page_robot.dart';
import 'robots/your_book_view_robot.dart';
import 'robots/your_shelf_view_robot.dart';
import 'test_data/test_data.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(BookListVOAdapter());
  Hive.registerAdapter(BookVOAdapter());
  Hive.registerAdapter(BuyLinkVOAdapter());
  Hive.registerAdapter(OverviewVOAdapter());
  Hive.registerAdapter(ShelfVOAdapter());

  await Hive.openBox<BookListVO>(BOX_NAME_BOOK_LIST_VO);
  await Hive.openBox<BookVO>(BOX_NAME_BOOK_VO);
  await Hive.openBox<BuyLinkVO>(BOX_NAME_BUY_LINK_VO);
  await Hive.openBox<OverviewVO>(BOX_NAME_OVERVIEW_VO);
  await Hive.openBox<BookVO>(BOX_NAME_ALL_BOOK_VO);
  await Hive.openBox<ShelfVO>(BOX_NAME_SHELF_VO);

  HomeViewRobot? homeViewRobot;
  BookDetailsPageRobot? bookDetailsPageRobot;
  CollectionDetailsPageRobot? collectionDetailsPageRobot;
  SearchPageRobot? searchPageRobot;
  LibraryViewRobot? libraryViewRobot;
  YourBookViewRobot? yourBookViewRobot;
  AddBookToShelfPageRobot? addBookToShelfPageRobot;
  YourShelfViewRobot? yourShelfViewRobot;
  AddNewShelfPageRobot? addNewShelfPageRobot;
  ShelvesDetailsPageRobot? shelvesDetailsPageRobot;

  testWidgets('Library Apptest', (WidgetTester tester) async {
    homeViewRobot = HomeViewRobot(tester);
    bookDetailsPageRobot = BookDetailsPageRobot(tester);
    collectionDetailsPageRobot = CollectionDetailsPageRobot(tester);
    searchPageRobot = SearchPageRobot(tester);
    libraryViewRobot = LibraryViewRobot(tester);
    yourBookViewRobot = YourBookViewRobot(tester);
    addBookToShelfPageRobot = AddBookToShelfPageRobot(tester);
    yourShelfViewRobot = YourShelfViewRobot(tester);
    addNewShelfPageRobot = AddNewShelfPageRobot(tester);
    shelvesDetailsPageRobot = ShelvesDetailsPageRobot(tester);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Add to library And Check Carousel
    await homeViewRobot?.findHomePageItemsAndTapBook();

    await bookDetailsPageRobot?.checkBookDetailsPageItemAndReturn(
        TEST_DATA_BOOK_NAME_TWO, TEST_DATA_BOOK_TWO_AUTHOR);

    await homeViewRobot?.isHomeViewPage();

    await homeViewRobot?.checkCarouselAndTap();

    await bookDetailsPageRobot?.checkBookDetailsPageItemAndReturn(
        TEST_DATA_BOOK_NAME_TWO, TEST_DATA_BOOK_TWO_AUTHOR);

    await homeViewRobot?.isHomeViewPage();

    // Tap More Collection

    await homeViewRobot?.tapMoreCollection();

    await collectionDetailsPageRobot?.isCollectionDetailsPage();

    await collectionDetailsPageRobot?.checkCollectionDetailsPageAndBack();

    await homeViewRobot?.isHomeViewPage();

    // Change Library View

    await homeViewRobot?.changeLibraryView();

    await libraryViewRobot?.isLibraryView();

    await yourBookViewRobot?.isYourBookView();

    await yourBookViewRobot?.changeViewTest();

    //Tap Book

    await yourBookViewRobot?.onTapBookItem();

    await bookDetailsPageRobot?.checkBookDetailsPageItemAndReturn(
        TEST_DATA_SEARCH_RESULT_BOOK_NAME, TEST_DATA_SEARCH_RESULT_AUTHOR_NAME);

    await yourBookViewRobot?.isYourBookView();

    //Create New Shelf
    await libraryViewRobot?.changeShelfView();

    await yourShelfViewRobot?.isYourShelfView();

    await yourShelfViewRobot?.tapAddNewShelf();

    await addNewShelfPageRobot?.isAddNewShelfPage();

    await addNewShelfPageRobot?.createNewShelf();

    await yourShelfViewRobot?.isYourShelfView();

    await yourShelfViewRobot?.checkShelfList();

    // ADD BOOK TO SHELF

    await libraryViewRobot?.changeLibraryView();

    await yourBookViewRobot?.isYourBookView();

    await yourBookViewRobot?.onTapBookSeeMoreAndAddToShelf();

    await addBookToShelfPageRobot?.isAddBookToShelfPage();

    await addBookToShelfPageRobot?.addToShelf();

    await yourBookViewRobot?.isYourBookView();

    // Check Shelf

    await libraryViewRobot?.changeShelfView();

    await yourShelfViewRobot?.isYourShelfView();

    await yourShelfViewRobot?.checkShelfList();

    // Check Shelf Details Page

    await yourShelfViewRobot?.tapShelf();

    await shelvesDetailsPageRobot?.isShelvesDetailsPage();

    await shelvesDetailsPageRobot?.renameShelf();

    await shelvesDetailsPageRobot?.deleteShelf();

    await yourShelfViewRobot?.isYourShelfView();

    await yourShelfViewRobot?.checkShelfListClear();

    // Search
    await homeViewRobot?.changeHomeView();

    await homeViewRobot?.tapSearch();

    await searchPageRobot?.isSearchPage();

    await searchPageRobot?.checkSearchPageItems();

    await searchPageRobot?.searchBookAndCheck();

    await searchPageRobot?.tapResultBook();

    await bookDetailsPageRobot?.checkBookDetailsPageItemAndReturn(
        TEST_DATA_SEARCH_RESULT_BOOK_NAME, TEST_DATA_SEARCH_RESULT_AUTHOR_NAME);

    await searchPageRobot?.isSearchPage();

    await searchPageRobot?.tapSearchButtonAndCheck();

    await bookDetailsPageRobot?.checkBookDetailsPageItemAndReturn(
        TEST_DATA_SEARCH_RESULT_BOOK_NAME, TEST_DATA_SEARCH_RESULT_AUTHOR_NAME);

    await searchPageRobot?.onTapBack();

    await homeViewRobot?.isHomeViewPage();
  });
}
