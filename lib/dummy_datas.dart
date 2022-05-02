import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/genre_vo.dart';
import 'package:library_app/data/vos/shelve_vo.dart';

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

List<GenreVO> genreList = [
  GenreVO(id: 1, name: 'Ebooks', isSelected: false),
  GenreVO(id: 2, name: 'Downloaded', isSelected: false),
  GenreVO(id: 3, name: 'Sample', isSelected: false),
  GenreVO(id: 4, name: 'Purchases', isSelected: false),
  GenreVO(id: 5, name: 'Audiobooks', isSelected: false),
];

List<BookVO> dummyBookList = [
  BookVO(id: 1, title: 'Book one', author: 'Author one'),
  BookVO(id: 2, title: 'Book two', author: 'Author two'),
  BookVO(id: 3, title: 'Book three', author: 'Author three'),
  BookVO(id: 4, title: 'Book four', author: 'Author four'),
  BookVO(id: 5, title: 'Book five', author: 'Author five'),
];

List<ShelveVO> dummyShelveList = [
  ShelveVO(id: 1, name: 'My Shelves', bookList: [
    BookVO(id: 1, title: 'Book one', author: 'Author one'),
    BookVO(id: 2, title: 'Book two', author: 'Author two'),
    BookVO(id: 3, title: 'Book three', author: 'Author three'),
  ]),
  ShelveVO(id: 2, name: 'My Second Shelves', bookList: [
    BookVO(id: 4, title: 'Book four', author: 'Author four'),
    BookVO(id: 5, title: 'Book five', author: 'Author five'),
  ]),
];

List<double> dummyRatingBarPercentList = [0.6, 0.2, 0.2, 0.1, 0.1];
