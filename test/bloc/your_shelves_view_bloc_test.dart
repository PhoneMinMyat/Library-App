import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/bloc/your_shelves_view_bloc.dart';

import '../data/models/ny_times_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  YourShelvesViewBloc? bloc;
  group(' Your ShelvesView Bloc', () {
    setUp(() {
      bloc = YourShelvesViewBloc(NyTimesModelImplMock());
    });

    test('fetch  Book List ', () {
      expect(bloc?.shelveList, getMockShelfList());
    });
  });
}
