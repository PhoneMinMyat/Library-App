import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/bloc/add_new_shelf_page_bloc.dart';

import '../data/models/ny_times_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main(){
  AddNewShelfPageBloc? bloc;
  group('Add New Shelf Page Bloc', (){
    setUp((){
      bloc = AddNewShelfPageBloc('1234124', NyTimesModelImplMock());
    });

    test('fetch Selected Book', (){
      expect(bloc?.selectedBook, getMockBookList()?.first);
    });
  });
}