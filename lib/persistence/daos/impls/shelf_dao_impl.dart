import 'package:hive/hive.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/shelf_vo.dart';
import 'package:library_app/persistence/daos/shelf_dao.dart';
import 'package:library_app/persistence/hive_constants.dart';

class ShelfDaoImpl extends ShelfDao {
  @override
  void saveShelf(String shelfName,[BookVO? selectedBook]) {
    String idAsString = DateTime.now().millisecond.toString() +
        DateTime.now().microsecond.toString();
    int id = int.parse(idAsString);
    ShelfVO tempShelf = ShelfVO(id: id, name: shelfName, bookList:(selectedBook == null)?  [] : [selectedBook]);
    getShelfBox().put(id, tempShelf);
  }

  @override
  void deleteShelf(int shelfId) {
    getShelfBox().delete(shelfId);
  }

  @override
  void renameShelf(String shelfName, int shelfId) {
    ShelfVO tempShelf = getSingleShelfFromDatabase(shelfId);
    tempShelf.name = shelfName;
    getShelfBox().put(tempShelf.id, tempShelf);
  }

  @override
  void addBookToShelf(int shelfId, BookVO book) {
    ShelfVO tempShelf = getSingleShelfFromDatabase(shelfId);
    print(book.primaryIsbn10);
    if (tempShelf.isBookContain(book.primaryIsbn10 ?? '')) {
    } else {
      tempShelf.bookList?.add(book);
      getShelfBox().put(tempShelf.id, tempShelf);
    }
  }

  @override
  void removeBookFromShelf(int shelfId, String bookId) {
    ShelfVO tempShelf = getSingleShelfFromDatabase(shelfId);
    tempShelf.bookList?.removeWhere((book) => book.primaryIsbn10 == bookId);
    getShelfBox().put(tempShelf.id, tempShelf);
  }

  @override
  ShelfVO getSingleShelfFromDatabase(int shelfId) {
    return getShelfBox().get(shelfId) ?? ShelfVO();
  }

  @override
  List<ShelfVO> getAllShelvesFromDatabase() {
    return getShelfBox().values.toList();
  }

  //Reactive
  @override
  Stream<void> getAllShelvesEventStream() {
    return getShelfBox().watch();
  }

  @override
  Stream<List<ShelfVO>> getAllShelvesFromDatabaseStream() {
    return Stream.value(getAllShelvesFromDatabase());
  }

  Box<ShelfVO> getShelfBox() {
    return Hive.box<ShelfVO>(BOX_NAME_SHELF_VO);
  }

  @override
  List<BookVO> getBooksFromShelves(int shelfId) {
    ShelfVO tempShelf = getSingleShelfFromDatabase(shelfId);
    if(tempShelf.bookList != null){
      return tempShelf.bookList ?? [];
    }else{
      return [];
    }
  }

  @override
  Stream<List<BookVO>> getBooksFromShelvesStream(int shelfId) {
    return Stream.value(getBooksFromShelves(shelfId));
  }


  @override
  Stream<ShelfVO> getShelfByShelfIdStream(int shelfId) {
    return Stream.value(getSingleShelfFromDatabase(shelfId));
  }

  
}
