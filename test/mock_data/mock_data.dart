import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/google_book_vo.dart';
import 'package:library_app/data/vos/google_idustry_identifiers_vo.dart';
import 'package:library_app/data/vos/google_item_vo.dart';
import 'package:library_app/data/vos/overview_vo.dart';
import 'package:library_app/data/vos/shelf_vo.dart';

List<BookVO>? getMockBookList() {
  return [
    BookVO(
        primaryIsbn10: '1',
        title: 'Book One',
        author: 'Author One',
        category: 'Category One',
        userViewedTime: '1'),
    BookVO(
        primaryIsbn10: '2',
        title: 'Book Two',
        author: 'Author Two',
        category: 'Category Two',userViewedTime: '2'),
    BookVO(
        primaryIsbn10: '3',
        title: 'Book Three',
        author: 'Author Three',
        category: 'Category Three',userViewedTime: '3'),
  ];
}

List<BookListVO>? getMockBookCollectionWithCategory() {
  return [
     BookListVO(
      listId: 1,
      listName: 'Category One',
      booksList: [
        BookVO(
          primaryIsbn10: '1',
          title: 'Book One',
          author: 'Author One',
        ),
        BookVO(
          primaryIsbn10: '2',
          title: 'Book Two',
          author: 'Author Two',
        ),
        BookVO(
          primaryIsbn10: '3',
          title: 'Book Three',
          author: 'Author Three',
        ),
      ],
    ),
    BookListVO(
      listId: 2,
      listName: 'Category One',
      booksList: [
        BookVO(
          primaryIsbn10: '4',
          title: 'Book Four',
          author: 'Author Four',
        ),
        BookVO(
          primaryIsbn10: '5',
          title: 'Book Five',
          author: 'Author Five',
        ),
        BookVO(
          primaryIsbn10: '6',
          title: 'Book Six',
          author: 'Author Six',
        ),
      ],
    ),
  ];
}

List<BookListVO>? getMockBookCollectionList() {
  return [
    BookListVO(
      listId: 1,
      listName: 'List One',
      booksList: [
        BookVO(
          primaryIsbn10: '1',
          title: 'Book One',
          author: 'Author One',
        ),
        BookVO(
          primaryIsbn10: '2',
          title: 'Book Two',
          author: 'Author Two',
        ),
        BookVO(
          primaryIsbn10: '3',
          title: 'Book Three',
          author: 'Author Three',
        ),
      ],
    ),
    BookListVO(
      listId: 2,
      listName: 'List Two',
      booksList: [
        BookVO(
          primaryIsbn10: '4',
          title: 'Book Four',
          author: 'Author Four',
        ),
        BookVO(
          primaryIsbn10: '5',
          title: 'Book Five',
          author: 'Author Five',
        ),
        BookVO(
          primaryIsbn10: '6',
          title: 'Book Six',
          author: 'Author Six',
        ),
      ],
    ),
  ];
}

OverviewVO? getMockOverview() {
  return OverviewVO(bookListsList: [
    BookListVO(
      listId: 1,
      listName: 'List One',
      booksList: [
        BookVO(
          primaryIsbn10: '1',
          title: 'Book One',
          author: 'Author One',
        ),
        BookVO(
          primaryIsbn10: '2',
          title: 'Book Two',
          author: 'Author Two',
        ),
        BookVO(
          primaryIsbn10: '3',
          title: 'Book Three',
          author: 'Author Three',
        ),
      ],
    ),
    BookListVO(
      listId: 2,
      listName: 'List Two',
      booksList: [
        BookVO(
          primaryIsbn10: '4',
          title: 'Book Four',
          author: 'Author Four',
        ),
        BookVO(
          primaryIsbn10: '5',
          title: 'Book Five',
          author: 'Author Five',
        ),
        BookVO(
          primaryIsbn10: '6',
          title: 'Book Six',
          author: 'Author Six',
        ),
      ],
    ),
  ]);
}

List<GoogleItemVO>? getMockGoogleItemVO() {
  return [
    GoogleItemVO(
      id: '1',
      kind: 'Google Item One',
      volumeInfo: GoogleBookVO(
          industryIdentifiers: [
            GoogleIdustryIdentifiersVO(type: 'ISBN_10', identifier: '0001')
          ],
          authors: ['Authors One'],
          title: 'Title One',
          description: 'Description One',
          categories: ['Categories One']),
    ),
    GoogleItemVO(
      id: '2',
      kind: 'Google Item Two',
      volumeInfo: GoogleBookVO(
          industryIdentifiers: [
            GoogleIdustryIdentifiersVO(type: 'ISBN_10', identifier: '0002')
          ],
          authors: ['Authors Two'],
          title: 'Title Two',
          description: 'Description Two',
          categories: ['Categories Two']),
    ),
    GoogleItemVO(
      id: '3',
      kind: 'Google Item Three',
      volumeInfo: GoogleBookVO(
          industryIdentifiers: [
            GoogleIdustryIdentifiersVO(type: 'ISBN_10', identifier: '0003')
          ],
          authors: ['Authors Three'],
          title: 'Title Three',
          description: 'Description Three',
          categories: ['Categories Three']),
    ),
  ];
}

List<ShelfVO>? getMockShelfList() {
  return [
    ShelfVO(id: 1, name: 'Shelf One', bookList: [
      BookVO(
        primaryIsbn10: '4',
        title: 'Book Four',
        author: 'Author Four',
      ),
      BookVO(
        primaryIsbn10: '5',
        title: 'Book Five',
        author: 'Author Five',
      ),
    ]),
    ShelfVO(id: 2, name: 'Shelf Two', bookList: [
      BookVO(
        primaryIsbn10: '2',
        title: 'Book Two',
        author: 'Author Two',
      ),
      BookVO(
        primaryIsbn10: '3',
        title: 'Book Three',
        author: 'Author Three',
      ),
    ]),
    ShelfVO(id: 3, name: 'Shelf Three', bookList: [
      BookVO(
        primaryIsbn10: '1',
        title: 'Book One',
        author: 'Author One',
      ),
      BookVO(
        primaryIsbn10: '6',
        title: 'Book Six',
        author: 'Author Six',
      ),
    ]),
  ];
}
