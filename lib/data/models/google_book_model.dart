import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/google_item_vo.dart';

abstract class GoogleBookModel {
  Future<List<BookVO>?> getSearchResultBookList(String searchKey);



  List<BookVO> convertGoogleBookVOToBookVO(List<GoogleItemVO> googleBookList);
}
