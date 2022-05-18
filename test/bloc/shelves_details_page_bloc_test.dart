import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/bloc/shelves_details_page_bloc.dart';

import '../data/models/ny_times_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  ShelvesDetailsPageBloc? bloc;
  group('Shelves Details Page Bloc', () {
    setUp(() {
      bloc = ShelvesDetailsPageBloc(1,NyTimesModelImplMock());
    });

    test('fetch  Book List From Shelf', () {
      expect(bloc?.bookListFromShelf, getMockShelfList()?.first.bookList);
    });


  });
}
