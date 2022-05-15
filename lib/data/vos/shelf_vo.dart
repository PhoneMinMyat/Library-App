import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/persistence/hive_constants.dart';

part 'shelf_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_SHELF_VO, adapterName: 'ShelfVOAdapter')
class ShelfVO {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  List<BookVO>? bookList;

  ShelfVO({
    this.id,
    this.name,
    this.bookList,
  });

  bool isBookContain(String bookId) {
    bool result = false;
    bookList?.forEach((book) {
      if (book.primaryIsbn10 == bookId) {
        result = true;
        print('FOUND');
      }
    });

    return result;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShelfVO &&
        other.id == id &&
        other.name == name &&
        listEquals(other.bookList, bookList);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ bookList.hashCode;
}
