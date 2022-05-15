import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:library_app/widget_keys.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:library_app/bloc/book_details_bloc.dart';
import 'package:library_app/data/vos/book_list_vo.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/dummy_datas.dart';
import 'package:library_app/pages/book_collection_details_page.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/resources/string.dart';
import 'package:library_app/viewitems/book_collection_section.dart';
import 'package:library_app/viewitems/image_and_title_section_view.dart';

class BookDetailsPage extends StatefulWidget {
  final String bookId;
  const BookDetailsPage({
    Key? key,
    required this.bookId,
  }) : super(key: key);

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  BookDetailsBloc? _bookDetailsBloc;

  @override
  void initState() {
    _bookDetailsBloc = BookDetailsBloc(widget.bookId);
    super.initState();
  }

  @override
  void dispose() {
    _bookDetailsBloc?.makeDispose();
    super.dispose();
  }

  void onTapBookItem(String bookId) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BookDetailsPage(
              bookId: bookId,
            )));
  }

  void onTapBookListMore(String title) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BookCollectionDetailsPage(titleName: title)));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _bookDetailsBloc,
      child: Scaffold(
        appBar: const CustomAppBarForBookDetails(),
        body: SingleChildScrollView(
          child: Selector<BookDetailsBloc, BookVO?>(
            selector: (context, bloc) => bloc.book,
            builder: (context, viewedBook, child) => Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TitleSectionView(
                  author: viewedBook?.author ?? '',
                  title: viewedBook?.title ?? '',
                  imageUrl: viewedBook?.bookImage ?? '',
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM_2x,
                ),
                const BookRatingAndTypeSection(),
                const SizedBox(
                  height: MARGIN_MEDIUM_2x,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
                  child: BuyingSection(),
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM_2x,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
                  child: AboutView(
                      onTapMore: () {},
                      title: 'About this eBook',
                      subTitle: viewedBook?.description ?? ''),
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM_2x,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
                  child: RatingAndReviewSectionView(),
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM_2x,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
                  child: AboutView(
                    onTapMore: () {},
                    title: 'About the author',
                    subTitle:
                        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
                  ),
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM_2x,
                ),
                BookCollectionSection(
                  (bookId) {
                    onTapBookItem(bookId);
                  },
                  listTitleName: 'More by this Authors',
                  bookCollection: BookListVO(),
                  onTapMore: (title) {
                    onTapBookListMore(title);
                  },
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM_2x,
                ),
                Selector<BookDetailsBloc, BookListVO?>(
                    selector: (context, bloc) => bloc.similarBooks,
                    shouldRebuild: (previous, next) => previous != next,
                    builder: (context, similarBooks, child) {
                      return BookCollectionSection(
                        (bookId) {
                          onTapBookItem(bookId);
                        },
                        listTitleName: SIMILAR_EBOOKS,
                        bookCollection: similarBooks ?? BookListVO(),
                        onTapMore: (title) {
                          onTapBookListMore(title);
                        },
                      );
                    }),
                const SizedBox(
                  height: MARGIN_MEDIUM_2x,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
                  child: RateThisBookSection(),
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM_2x,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
                  child: PolicySectionView(),
                ),
                const SizedBox(
                  height: MARGIN_XXLARGE,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RatingAndReviewSectionView extends StatelessWidget {
  const RatingAndReviewSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Text(
              RATING_AND_REVIEWS,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: TEXT_REGULAR_2x),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.blue,
              ),
            )
          ],
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        const RatingView(),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return const UserCommentView();
            })
      ],
    );
  }
}

class RatingView extends StatelessWidget {
  const RatingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BigRatingView(),
        const SizedBox(
          width: MARGIN_MEDIUM_2x,
        ),
        Expanded(
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: dummyBookList.length,
            itemBuilder: (context, index) {
              double tempPercent = dummyRatingBarPercentList[index];
              return TextAndRatingBar(
                text: (5 - index).toString(),
                percent: tempPercent,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: MARGIN_MEDIUM,
            ),
          ),
        )
      ],
    );
  }
}

class TextAndRatingBar extends StatelessWidget {
  final String text;
  final double percent;
  const TextAndRatingBar({
    required this.text,
    required this.percent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text),
        const SizedBox(
          width: MARGIN_MEDIUM,
        ),
        RatingLine(
          percent: percent,
        )
      ],
    );
  }
}

class RatingLine extends StatelessWidget {
  final double percent;
  const RatingLine({
    this.percent = 5.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 220,
          height: 12,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(12 / 2),
            ),
          ),
        ),
        Container(
          width: (percent == 0.0) ? 220 * 2.0 : 220 * percent,
          height: 12,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(12 / 2),
            ),
          ),
        ),
      ],
    );
  }
}

class BigRatingView extends StatelessWidget {
  const BigRatingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '4.4',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: RATING_BIG_TEXT_SIZE),
        ),
        RatingBar.builder(
            itemSize: MARGIN_MEDIUM_2x,
            initialRating: 3,
            itemBuilder: (context, index) {
              return const Icon(
                Icons.star,
                color: Colors.blue,
              );
            },
            onRatingUpdate: (updateRating) {}),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        const Text('301 total'),
      ],
    );
  }
}

class UserCommentView extends StatelessWidget {
  const UserCommentView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: USER_COMMENT_SECTION_HEIGHT,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CircleAvatar(
            maxRadius: MARGIN_MEDIUM_3x,
            child: Icon(
              Icons.person,
              size: MARGIN_XLARGE,
            ),
          ),
          SizedBox(
            width: MARGIN_MEDIUM_2x,
          ),
          Expanded(child: CommentSection())
        ],
      ),
    );
  }
}

class CommentSection extends StatelessWidget {
  const CommentSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: MARGIN_SMALL,
        ),
        const Text(
          'Tom',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: MARGIN_SMALL,
        ),
        const RatingAndDateSection(),
        const SizedBox(
          height: MARGIN_SMALL,
        ),
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris hendrerit tempus auctor. Sed vehicula lorem vitae ornare bibendum. Duis et purus orci. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis at interdum diam. Cras tempor pulvinar ipsum vitae laoreet. Sed in ligula finibus, ullamcorper leo vitae, fringilla ligula. Proin consectetur ante nec mauris accumsan, quis euismod enim venenatis. Nam id efficitur ante. Fusce non aliquet nisl, id eleifend augue. Praesent convallis rhoncus velit, et luctus magna tempus sit amet. Vivamus metus odio, condimentum sit amet',
          maxLines: 4,
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        Row(
          children: [
            const Text(
              'Was this review helpful?',
              style: TextStyle(color: Colors.black87),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM, vertical: MARGIN_SMALL),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: Colors.black54,
                  ),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(MARGIN_MEDIUM_2x))),
              child: const Text('Yes'),
            ),
            const SizedBox(
              width: MARGIN_MEDIUM_2x,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM, vertical: MARGIN_SMALL),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: Colors.black54,
                  ),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(MARGIN_MEDIUM_2x))),
              child: const Text('No'),
            ),
          ],
        ),
      ],
    );
  }
}

class RatingAndDateSection extends StatelessWidget {
  const RatingAndDateSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
            itemSize: MARGIN_MEDIUM_2x,
            initialRating: 3,
            itemBuilder: (context, index) {
              return const Icon(
                Icons.star,
                color: Colors.blue,
              );
            },
            onRatingUpdate: (updateRating) {}),
        const SizedBox(
          width: MARGIN_MEDIUM,
        ),
        const Text(
          '12 Oct 2020',
          style: TextStyle(color: Colors.black54),
        )
      ],
    );
  }
}

class PolicySectionView extends StatelessWidget {
  const PolicySectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Icon(
              Icons.replay_circle_filled,
              color: Colors.black54,
            ),
            SizedBox(
              width: MARGIN_CARD_MEDIUM_2,
            ),
            Text(
              GOOGLE_PLAY_REFUND,
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Row(
          children: const [
            Icon(Icons.info_outline, color: Colors.black54),
            SizedBox(
              width: MARGIN_CARD_MEDIUM_2,
            ),
            Text(
              ALL_PRICES_INCLUDE_GST,
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }
}

class RateThisBookSection extends StatelessWidget {
  const RateThisBookSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          RATE_THIS_E_BOOK,
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: TEXT_REGULAR_2x),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        const Text(
          TELL_OTHERS_WHAT_YOU_THINK,
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        Center(
          child: RatingBar.builder(
              allowHalfRating: true,
              itemSize: 40,
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Colors.blue,
                );
              },
              onRatingUpdate: (rating) {}),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM, vertical: MARGIN_MEDIUM),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 0.5),
                  borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
              child: const Text(
                WRITE_A_REVIEW,
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black54, width: 0.5))),
        )
      ],
    );
  }
}

class AboutView extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function onTapMore;
  const AboutView({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onTapMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: TEXT_REGULAR_2x),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                onTapMore();
              },
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.blue,
              ),
            )
          ],
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          subTitle,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.black54),
        )
      ],
    );
  }
}

class BuyingSection extends StatelessWidget {
  const BuyingSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ButtonViewSection(),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        const Text(
          'Was \$17.71',
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: TEXT_SMALL_2x, color: Colors.black54),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        Row(
          children: const [
            Icon(
              MdiIcons.tagOutline,
              color: Colors.black54,
              size: MARGIN_MEDIUM_3x,
            ),
            SizedBox(
              width: MARGIN_MEDIUM,
            ),
            Text(
              '52% price drop on 10 Apr',
              style: TextStyle(fontSize: TEXT_SMALL_2x, color: Colors.black54),
            )
          ],
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_3x,
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black54),
            ),
          ),
        )
      ],
    );
  }
}

class ButtonViewSection extends StatelessWidget {
  const ButtonViewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Expanded(
          child: CustomBuyButton(
            text: FREE_SAMPLE,
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM,
        ),
        Expanded(
          child: CustomBuyButton(
            text: BUY,
            isBlueButton: true,
          ),
        ),
      ],
    );
  }
}

class CustomBuyButton extends StatelessWidget {
  final String text;
  final bool isBlueButton;
  const CustomBuyButton({
    required this.text,
    this.isBlueButton = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: MARGIN_MEDIUM, horizontal: MARGIN_MEDIUM_2x),
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: (isBlueButton) ? Colors.white : Colors.blue),
      )),
      decoration: BoxDecoration(
          color: (isBlueButton) ? Colors.blue : null,
          border: (isBlueButton) ? null : Border.all(width: 0.5),
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
    );
  }
}

class BookRatingAndTypeSection extends StatelessWidget {
  const BookRatingAndTypeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
      height: BOOK_DETAILS_RATING_AND_INFO_SECTION_HEIGHT,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          BookInfoItem(
            topWidget: RatingText(
              rating: '4.8',
            ),
            bottomWidget: Text('2 reviews',
                style:
                    TextStyle(color: Colors.black54, fontSize: TEXT_SMALL_2x)),
          ),
          VerticalShorLine(),
          BookInfoItem(
            topWidget: Icon(
              Icons.book_outlined,
              color: Colors.black54,
            ),
            bottomWidget: Text('eBook',
                style:
                    TextStyle(color: Colors.black54, fontSize: TEXT_SMALL_2x)),
          ),
          VerticalShorLine(),
          BookInfoItem(
            topWidget: Text(
              '352',
              style:
                  TextStyle(color: Colors.black54, fontSize: TEXT_REGULAR_2x),
            ),
            bottomWidget: Text('Pages',
                style:
                    TextStyle(color: Colors.black54, fontSize: TEXT_SMALL_2x)),
          ),
          VerticalShorLine(),
          BookInfoItem(
            topWidget: Icon(
              MdiIcons.homeHeart,
              color: Colors.black54,
            ),
            bottomWidget: Text('Eligible',
                style:
                    TextStyle(color: Colors.black54, fontSize: TEXT_SMALL_2x)),
          ),
        ],
      ),
    );
  }
}

class VerticalShorLine extends StatelessWidget {
  const VerticalShorLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MARGIN_CARD_MEDIUM_2),
      child: Container(
        padding: const EdgeInsets.symmetric(),
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(color: Colors.black, width: 0.5),
          ),
        ),
      ),
    );
  }
}

class RatingText extends StatelessWidget {
  final String rating;
  const RatingText({
    required this.rating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          rating,
          style:
              const TextStyle(color: Colors.black54, fontSize: TEXT_REGULAR_2x),
        ),
        const Icon(
          Icons.star,
          color: Colors.black54,
        )
      ],
    );
  }
}

class BookInfoItem extends StatelessWidget {
  final Widget topWidget;
  final Widget bottomWidget;
  const BookInfoItem({
    Key? key,
    required this.topWidget,
    required this.bottomWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [topWidget, bottomWidget],
    );
  }
}

class TitleSectionView extends StatelessWidget {
  final String author;
  final String title;
  final String imageUrl;
  const TitleSectionView({
    Key? key,
    required this.author,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BOOK_DETAILS_TITLE_SECTION_HEIGHT,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
      child: ImageAndTitleSectionView(
        key: const Key(KEY_DETAILS_PAGE_TITLE_AND_AUTHOR_SECTION),
        imageUrl: imageUrl,
        title: title,
        author: author,
        isListItem: false,
      ),
      // Row(
      //   children: [
      //     SizedBox(
      //       width: MediaQuery.of(context).size.width * 0.3,
      //       child: Image.network(
      //           'https://www.skipprichard.com/wp-content/uploads/2016/01/9780062367556.jpg'),
      //     ),
      //     const SizedBox(
      //       width: MARGIN_MEDIUM,
      //     ),
      //     Expanded(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: const [
      //           Text(
      //             'The Stranger in the Lifeboat',
      //             style: TextStyle(
      //                 fontWeight: FontWeight.bold, fontSize: TEXT_HEADING),
      //           ),
      //           SizedBox(
      //             height: MARGIN_MEDIUM_2x,
      //           ),
      //           Text('Mitch Albom'),
      //           SizedBox(
      //             height: MARGIN_MEDIUM,
      //           ),
      //           Text('HarperCollins')
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

class CustomAppBarForBookDetails extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarForBookDetails({
    Key? key,
  })  : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.chevron_left,
          color: Colors.grey,
          size: MARGIN_LARGE,
          key: Key(KEY_BOOK_DETAILS_PAGE_BACK_BUTOON),
        ),
      ),
      actions: const [
        Icon(
          Icons.search,
          color: Colors.grey,
          size: MARGIN_LARGE,
        ),
        SizedBox(
          width: MARGIN_MEDIUM_2x,
        ),
        Icon(
          Icons.bookmark_add_outlined,
          color: Colors.grey,
          size: MARGIN_LARGE,
        ),
        SizedBox(
          width: MARGIN_MEDIUM_2x,
        ),
        Icon(
          Icons.more_vert,
          color: Colors.grey,
          size: MARGIN_LARGE,
        ),
        SizedBox(
          width: MARGIN_MEDIUM_2x,
        )
      ],
    );
  }

  @override
  final Size preferredSize;
}
