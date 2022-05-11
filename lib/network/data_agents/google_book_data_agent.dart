import 'package:library_app/data/vos/google_item_vo.dart';

abstract class GoogleBookDataAgent{
  Future<List<GoogleItemVO>?> getGoogleBookItem(String searchKey);
}