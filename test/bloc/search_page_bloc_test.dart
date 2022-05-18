import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/bloc/search_page_bloc.dart';

import '../data/models/google_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  SearchPageBloc? bloc;
  group('Search Page Bloc', () {
    setUp(() {
      bloc = SearchPageBloc(GoogleModelImplMock());
    });

    test('fetch  resultBook', () async {
      bloc?.runFilter('Search Word');
      await Future.delayed(const Duration(milliseconds: 500));
      expect(bloc?.resultSearchBook, getMockBookList());
    });

   
  });
}
