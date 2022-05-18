 import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/bloc/add_book_to_shelf_page_bloc.dart';

import '../data/models/ny_times_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  AddBookToShelfPageBloc? bloc;

  group('Add Book To Shelf Bloc', (){
    setUp((){
      bloc = AddBookToShelfPageBloc('63546', NyTimesModelImplMock());
    });


    test('Fetch shelf list', (){
      expect(bloc?.shelveList, getMockShelfList());
    });
  });
}