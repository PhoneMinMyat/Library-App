import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/data/models/ny_times_model_impl.dart';
import 'package:library_app/data/vos/book_vo.dart';

import '../../mock_data/mock_data.dart';
import '../../network/ny_times_book_data_agent_mock.dart';
import '../../persistence/all_book_dao_impl_mock.dart';
import '../../persistence/book_list_dao_impl_mock.dart';
import '../../persistence/shelf_dao_impl_mock.dart';
import '../../persistence/viewed_book_dao_impl_mock.dart';

void main() {
  group('NyTimesModelTesting', () {
    var nyTimesModel = NyTimesModelImpl();

    nyTimesModel.setDaoAndDataAgent(
        BookListDaoImplMock(),
        ViewedBookDaoImplMock(),
        AllBookDaoImplMock(),
        ShelfDaoImplMock(),
        NyTimesBookDataAgentMock());

    List<BookVO>? getBookListForCategory() {
      List<BookVO> returnBookList = [];
      getMockBookCollectionList()?.forEach(
        (bookList) {
          List<BookVO> tempBookList = bookList.details?.map((book) {
                BookVO tempBook = book;

                tempBook.category = 'list';
                return tempBook;
              }).toList() ??
              [];
          returnBookList.addAll(tempBookList);
        },
      );

      return returnBookList;
    }

    test('Category Book List Details', () {
      expect(
        nyTimesModel.getBookCategoryListDetails('list', '1'),
        completion(
          equals(
            getBookListForCategory(),
          ),
        ),
      );
    });

    test(
      'Overview Book List From Database',
      () {
        expect(nyTimesModel.getOverviewBookListFromDatabase(),
            emits(getMockBookCollectionList()));
      },
    );

    test('get Viewed Book List From Database', () {
      expect(nyTimesModel.getViewedBookListFromDatabase(),
          emits(getMockBookList()));
    });

    test('Get Single Book From Database', () {
      expect(nyTimesModel.getSingleBookFromDatabase('0'),
          emits(getMockBookList()?.first));
    });

    test('Get books by category from database', () {
      expect(nyTimesModel.getBooksByCategoryFromDatabase('test'),
          emits(getMockBookList()));
    });

    test('Filter Book List By Category', () {
      expect(
          nyTimesModel.filterBookListByCategory([]), emits(getMockBookList()));
    });

    test('Get Shelf List From Database', () {
      expect(
          nyTimesModel.getShelfListFromDatabase(), emits(getMockShelfList()));
    });

    test('Get Shelf By Id', () {
      expect(nyTimesModel.getShelfById(0), emits(getMockShelfList()?.first));
    });

    ///
  });
}
