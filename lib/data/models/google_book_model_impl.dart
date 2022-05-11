import 'package:library_app/data/models/google_book_model.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/google_book_vo.dart';
import 'package:library_app/data/vos/google_item_vo.dart';
import 'package:library_app/network/data_agents/google_book_data_agent.dart';
import 'package:library_app/network/data_agents/retrofit_google_book_data_agent_impl.dart';
import 'package:collection/collection.dart';
import 'package:library_app/persistence/daos/all_book_dao.dart';
import 'package:library_app/persistence/daos/impls/all_book_dao_impl.dart';

class GoogleBookModelImpl extends GoogleBookModel {
  static final GoogleBookModelImpl _singleton = GoogleBookModelImpl._internal();

  factory GoogleBookModelImpl() {
    return _singleton;
  }

  GoogleBookModelImpl._internal();

  //Network
  final GoogleBookDataAgent _mDataAgent = RetrofitGoogleBookDataAgentImpl();

  final AllBookDao _mAllBookDao = AllBookDaoImpl();

  @override
  Future<List<BookVO>?> getSearchResultBookList(String searchKey) {
    return _mDataAgent.getGoogleBookItem(searchKey).then((googleItemList) {
      List<BookVO> tempNYBookList =
          convertGoogleBookVOToBookVO(googleItemList ?? []);
      _mAllBookDao.saveAllBook(tempNYBookList);
      return tempNYBookList;
    }).catchError((error) => print('Error Form Model =====> $error'));
  }

  @override
  List<BookVO> convertGoogleBookVOToBookVO(List<GoogleItemVO> googleBookList) {
    List<BookVO> tempBookList = [];
    googleBookList.forEach((googleItem) {
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
}
