import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/bloc/book_details_bloc.dart';
import 'package:library_app/bloc/home_view_bloc.dart';

import '../data/models/ny_times_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  HomeViewBloc? bloc;
  group(' HomeView Bloc', () {
    setUp(() {
      bloc = HomeViewBloc(NyTimesModelImplMock());
    });

    test('fetch  Book collection', () {
      expect(bloc?.bookCollectionList, getMockBookCollectionList());
    });

    test('recent viewed book list', (){
      expect(bloc?.recentViewedBookList, getMockBookList()?.reversed.toList());
    });
  });
}
