import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/category_chip_vo.dart';
import 'package:library_app/data/vos/shelf_vo.dart';

List<String> eBooksCollectionTitle = [
  'More like Don\'t Make Me Think, Revisited',
  'Ebooks for you',
  'On your wishlist',
  'Most Popular'
];

List<String> audioBooksCollectionTitle = [
  'More like Don\'t Make Me Think, Revisited',
  'Audiobooks for you',
  'On your wishlist',
  'Most Popular',
  'People Like You Listen'
];

List<CategoryChipVO> genreList = [
  CategoryChipVO(name: 'Ebooks', isSelected: false),
  CategoryChipVO(name: 'Downloaded', isSelected: false),
  CategoryChipVO(name: 'Sample', isSelected: false),
  CategoryChipVO(name: 'Purchases', isSelected: false),
  CategoryChipVO(name: 'Audiobooks', isSelected: false),
];

List<BookVO> dummyBookList = [
  BookVO(primaryIsbn10: '1', title: 'Book one', author: 'Author one'),
  BookVO(primaryIsbn10: '2', title: 'Book two', author: 'Author two'),
  BookVO(primaryIsbn10: '3', title: 'Book three', author: 'Author three'),
  BookVO(primaryIsbn10: '4', title: 'Book four', author: 'Author four'),
  BookVO(primaryIsbn10: '5', title: 'Book five', author: 'Author five'),
];

List<ShelfVO> dummyShelveList = [
  ShelfVO(id: 1, name: 'My Shelves', bookList: [
    BookVO(primaryIsbn10: '1', title: 'Book one', author: 'Author one'),
    BookVO(primaryIsbn10: '2', title: 'Book two', author: 'Author two'),
    BookVO(primaryIsbn10: '3', title: 'Book three', author: 'Author three'),
  ]),
  ShelfVO(id: 2, name: 'My Second Shelves', bookList: [
    BookVO(primaryIsbn10: '4', title: 'Book four', author: 'Author four'),
    BookVO(primaryIsbn10: '5', title: 'Book five', author: 'Author five'),
  ]),
];

List<double> dummyRatingBarPercentList = [0.6, 0.2, 0.2, 0.1, 0.1];
