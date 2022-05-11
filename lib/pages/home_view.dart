import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:library_app/pages/book_collection_details_page.dart';
import 'package:library_app/pages/book_details_page.dart';
import 'package:library_app/resources/string.dart';
import 'package:provider/provider.dart';

import 'package:library_app/bloc/home_view_bloc.dart';
import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/viewitems/book_collection_listview_section.dart';
import 'package:library_app/viewitems/carousel_book_item.dart';
import 'package:library_app/viewitems/tab_bar_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewBloc? homeViewBloc;

  @override
  void initState() {
    homeViewBloc = HomeViewBloc();
    super.initState();
  }

  @override
  void dispose() {
    homeViewBloc?.makeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => homeViewBloc,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: APPBAR_HEIGHT,
            ),
            Selector<HomeViewBloc, List<BookVO>?>(
              selector: (context, bloc) => bloc.recentViewedBookList,
              builder: (context, recentViewedBookList, child) => Container(
                padding: (recentViewedBookList?.isNotEmpty ?? false)
                    ? const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2x)
                    : null,
                child: CarouselSliderSectionView(
                  recentViewedList: recentViewedBookList ?? [],
                  onTapCarousel: (bookId) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BookDetailsPage(bookId: bookId)));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: MARGIN_MEDIUM_2x,
            ),
            TabBarSectionView(
              (selectedIndex) {
                HomeViewBloc bloc =
                    Provider.of<HomeViewBloc>(context, listen: false);

                bloc.onTapHomeTabBar(selectedIndex);
              },
              tabBarNames: const [EBOOKS, AUDIOBOOKS],
            ),
            const SizedBox(
              height: MARGIN_MEDIUM_2x,
            ),
            Selector<HomeViewBloc, List<BookListVO>?>(
              selector: (context, bloc) => bloc.bookCollectionList,
              builder: (context, bookCollectionList, child) =>
                  BookCollectionListViewSection(
                      bookCollectionList: bookCollectionList ?? [],
                      onTapBook: (bookId) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                BookDetailsPage(bookId: bookId)));
                      },
                      onTapMore: (title) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                BookCollectionDetailsPage(titleName: title)));
                      }),
            )
          ],
        ),
      ),
    );
  }
}

class CarouselSliderSectionView extends StatelessWidget {
  final List<BookVO> recentViewedList;
  final Function(String) onTapCarousel;
  const CarouselSliderSectionView({
    Key? key,
    required this.onTapCarousel,
    required this.recentViewedList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: recentViewedList.length,
      itemBuilder: (context, itemIndex, pageViewIndex) {
        return CarouselBookItem(
          book: recentViewedList[itemIndex],
          onTapCarousel: (bookId) {
            onTapCarousel(bookId);
          },
        );
      },
      options: CarouselOptions(
        initialPage: 0,
        enableInfiniteScroll: false,

        // autoPlay: true,
        // autoPlayInterval: const Duration(seconds: 10),
        // autoPlayAnimationDuration:
        //     const Duration(milliseconds: 800),
        // autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        height: (recentViewedList.length == 0) ? 0 : CAROUSEL_CARD_HEIGHT,
        //aspectRatio: 2,
        viewportFraction: 0.5,
      ),
    );
  }
}
