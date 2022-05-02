import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/viewitems/book_collection_listview_section.dart';
import 'package:library_app/viewitems/book_collection_section.dart';
import 'package:library_app/viewitems/carousel_book_item.dart';
import 'package:library_app/viewitems/tab_bar_view.dart';

class HomeView extends StatelessWidget {
  final List<String> homeTabBarNames;
  final List<String> collectionTitles;
  final Function(int) onTapHomeTabBar;
  final Function onTapBook;
  final Function(String) onTapMore;
  const HomeView(
    this.onTapHomeTabBar, {
    required this.collectionTitles,
    required this.homeTabBarNames,
    required this.onTapBook,
    required this.onTapMore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: APPBAR_HEIGHT,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2x),
            child: const CarouselSliderSectionView(),
          ),
          const SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          TabBarSectionView(
            (selectedIndex) {
              onTapHomeTabBar(selectedIndex);
            },
            tabBarNames: homeTabBarNames,
          ),
          const SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          BookCollectionListViewSection(
              collectionTitles: collectionTitles,
              onTapBook: onTapBook,
              onTapMore: onTapMore),
        ],
      ),
    );
  }
}

class CarouselSliderSectionView extends StatelessWidget {
  const CarouselSliderSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, itemIndex, pageViewIndex) {
        return const CarouselBookItem();
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
        height: CAROUSEL_CARD_HEIGHT,
        //aspectRatio: 2,
        viewportFraction: 0.5,
      ),
    );
  }
}
