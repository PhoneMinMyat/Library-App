import 'package:hive/hive.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/persistence/hive_constants.dart';

@HiveType(typeId: HIVE_TYPE_ID_SHELF_VO, adapterName: 'ShelfVOAdapter')
class ShelfVO {

  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final List<BookVO>? bookList;
  ShelfVO({
    this.id,
    this.name,
    this.bookList,
  });
}
