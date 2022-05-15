import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/data/models/google_book_model_impl.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/google_book_vo.dart';
import 'package:collection/collection.dart';

import '../../mock_data/mock_data.dart';
import '../../network/google_book_data_agent_mock.dart';
import '../../persistence/all_book_dao_impl_mock.dart';

void main() {
  group('Google Book Model Testing', () {
    var googleModel = GoogleBookModelImpl();
    setUp(() {
      googleModel.setDaoAndDataAgent(
          GoogleBookDataAgentMock(), AllBookDaoImplMock());
    });

    List<BookVO>? convertGoogleBook() {
      List<BookVO> tempBookList = [];
      getMockGoogleItemVO()?.forEach((googleItem) {
        BookVO tempBookVO = BookVO();
        GoogleBookVO tempGoogleBookVO = googleItem.volumeInfo ?? GoogleBookVO();

        String? tempISBN10Identifier = tempGoogleBookVO.industryIdentifiers
            ?.firstWhereOrNull((element) => element.type == 'ISBN_10')
            ?.identifier;

        String? tempOTHERIdentifier = tempGoogleBookVO.industryIdentifiers
            ?.firstWhereOrNull((element) => element.type == 'OTHER')
            ?.identifier;
        tempBookVO.author = tempGoogleBookVO.getAuthorsAsCommaSperatedString();
        tempBookVO.bookImage = tempGoogleBookVO.imageLinks?.thumbail;
        tempBookVO.description = tempGoogleBookVO.description;
        tempBookVO.publisher = tempGoogleBookVO.publisher;
        tempBookVO.createdDate = tempGoogleBookVO.publishedDate;
        tempBookVO.title = tempGoogleBookVO.title;
        tempBookVO.category =
            tempGoogleBookVO.getCategoriesAsCommaSeperatdString();

        if (tempISBN10Identifier != null) {
          tempBookVO.primaryIsbn10 = tempISBN10Identifier;
        } else {
          if (tempOTHERIdentifier != null) {
            tempBookVO.primaryIsbn10 = tempOTHERIdentifier;
          } else {
            tempBookVO.primaryIsbn10 = tempGoogleBookVO.title ?? '';
          }
        }

        tempBookVO.primaryIsbn13 = tempGoogleBookVO.industryIdentifiers
            ?.firstWhereOrNull((element) => element.type == 'ISBN_13')
            ?.identifier;
        print('${tempBookVO.title} ====> ${tempBookVO.primaryIsbn10}');
        tempBookList.add(tempBookVO);
      });
      print('tempBookList ===> ${tempBookList.length}');
      return tempBookList;
    }

    test('Get Search Result Book List', () {
      expect(googleModel.getSearchResultBookList('flutter'),
          completion(convertGoogleBook()));
    });

    test('Convert Google Book To Book VO', () {
      expect(
          googleModel.convertGoogleBookVOToBookVO(getMockGoogleItemVO() ?? []),
          convertGoogleBook());
    });
  });
}
