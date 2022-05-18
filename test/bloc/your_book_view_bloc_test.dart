import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/bloc/your_book_view_bloc.dart';

import '../data/models/ny_times_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  YourBookViewBloc? bloc;
  group('Your BookView Bloc', () {
    setUp(() {
      bloc = YourBookViewBloc(NyTimesModelImplMock());
    });

    test('fetch  Book List ', () {
      expect(bloc?.yourBookList, getMockBookList()?.reversed.toList());
    });
  });
}
