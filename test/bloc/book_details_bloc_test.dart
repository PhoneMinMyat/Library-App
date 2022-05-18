import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/bloc/book_details_bloc.dart';

import '../data/models/ny_times_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  BookDetailsBloc? bloc;
  group('Book Details Bloc', () {
    setUp(() {
      bloc = BookDetailsBloc('1234124', NyTimesModelImplMock());
    });

    test('fetch  Book', () {
      expect(bloc?.book, getMockBookList()?.first);
    });

    
  });
}
