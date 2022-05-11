import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/data/vos/overview_vo.dart';

abstract class NyTimesBookDataAgent{
  Future<OverviewVO?> getOverviewBookList();
  Future<List<BookListVO>?> getListBookList(String list, String pageOffset);
}