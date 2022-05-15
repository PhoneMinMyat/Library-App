import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/ny_times_model.dart';
import 'package:library_app/data/models/ny_times_model_impl.dart';
import 'package:library_app/data/vos/shelf_vo.dart';

class YourShelvesViewBloc extends ChangeNotifier {
  //Variables
  bool isDispose = false;

  //Variablse

  List<ShelfVO>? shelveList;

  final NyTimesModel _model = NyTimesModelImpl();

  YourShelvesViewBloc() {
    _model.getShelfListFromDatabase().listen((shelfListFromDB) {
      shelveList = shelfListFromDB;
      safeNotifyListeners();
    }).onError((error) => print(error));
  }

  void safeNotifyListeners() {
    if (isDispose == false) {
      notifyListeners();
    }
  }

  void makeDispose() {
    if (isDispose == false) {
      isDispose = true;
    }
  }
}
