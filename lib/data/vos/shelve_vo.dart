import 'package:library_app/data/vos/book_vo.dart';

class ShelveVO {
  final int? id;
  final String? name;
  final List<BookVO>? bookList;
  ShelveVO({
    this.id,
    this.name,
    this.bookList,
  });
}
