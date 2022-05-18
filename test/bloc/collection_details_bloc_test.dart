import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/bloc/book_details_bloc.dart';
import 'package:library_app/bloc/collection_details_bloc.dart';

import '../data/models/ny_times_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  CollectionDetailsBloc? bloc;
  group('Collection Details Page Bloc', () {
    setUp(() {
      bloc = CollectionDetailsBloc('1234124', NyTimesModelImplMock());
    });

    test('fetch  Book List', () {
      expect(bloc?.bookList, getMockBookList());
    });

    
  });
}
