import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/ui/message/message_screen.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:mr_mart/Widgets/GridAnimation.dart';
import 'package:mr_mart/ui/category/trendings_item/trending_items_screen.dart';
import 'package:mr_mart/ui/category/recommemded_Items/recommended_items_screen.dart';
import 'package:mr_mart/ui/category/Items_details/item_details_screen.dart';
import 'package:mr_mart/Language/Language.dart';

Language language = Language();

class ShopDetailsBody extends StatefulWidget {
  @override
  _ShopDetailsBodyState createState() => _ShopDetailsBodyState();
}

class _ShopDetailsBodyState extends State<ShopDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 0.2,
                  spreadRadius: 0.0,
                  offset: Offset(0, 1.0),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset(
                                'assets/demo/shop_details_circle_image.png'),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Giant Food Stores.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Sed quis pretium mauris  '
                                    'massa amet tempus ullamcorper.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(height: 1),
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/rating.svg'),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                        child: Text(
                                          '4.8 (520)',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .copyWith(height: 1),
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/distance.svg'),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                        child: Text(
                                          '05 km Away',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .copyWith(height: 1),
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          width: Get.width * 0.25,
                                          height: 40,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(
                                            top: Dimension.size3,
                                            bottom: Dimension.size3,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Themes.primary2,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Text(
                                            'Follow',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        Dimension.textMedium),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MessageScreen()),
                                          );
                                        },
                                        child: Container(
                                          width: Get.width * 0.25,
                                          height: 40,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(
                                            top: Dimension.size3,
                                            bottom: Dimension.size3,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Themes.primary2,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Text(
                                            'Message',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                .copyWith(
                                                  color: Themes.white,
                                                  fontWeight:
                                                      Dimension.textMedium,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 0.2,
                  spreadRadius: 0.0,
                  offset: Offset(0, 1.0),
                )
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          'assets/icons/location_picker_fill.svg',
                          height: 20,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        child: Text(
                          '2025 M street, 3rd bloke northwest, washington, 20036.',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(height: 1),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.black.withOpacity(.3),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                          child: SvgPicture.asset(
                        'assets/icons/call_fill.svg',
                        height: 20,
                      )),
                      SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        child: Text(
                          '+987 6709 1248 0854',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(height: 1),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  height: 1,
                  color: Colors.black.withOpacity(.3),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                          child: SvgPicture.asset(
                        'assets/icons/time.svg',
                        height: 20,
                      )),
                      SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        child: Text(
                          'Open 11:00 AM - 11:00 AM',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(height: 1),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          titleHeader(
              title: Language().trendingItem,
              press: TrendingItemsScreen(),
              context: context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: trendingItem(),
          ),
          SizedBox(
            height: 5,
          ),
          titleHeader(
              title: Language().featuredItem,
              press: RecommendedItemsScreen(),
              context: context),
          SizedBox(
            height: 10,
          ),
          featuredItems(context),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'All Terms',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          allCategory(),
          SizedBox(
            height: 0,
          ),
          allItems(context),
        ],
      ),
    );
  }
}

Widget titleHeader({String title, press, context}) {
  return Padding(
    padding: EdgeInsets.only(left: Dimension.padding),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        )),
        TextButton(
          onPressed: () {},
          child: InkWell(
            child: Text(
              Language().seeAll,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => press),
              );
            },
          ),
        )
      ],
    ),
  );
}

Widget trendingItem() {
  double width = Get.width * 0.4;
  return Container(
    height: Get.height * 0.30,
    margin: EdgeInsets.only(top: Dimension.size5),
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      itemCount: 3,
      itemBuilder: (context, index) {
        return gridAnimation(
          column: 3,
          index: index,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
              );
            },
            child: Container(
              width: width,
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.only(
                left: Dimension.size10,
                bottom: Dimension.padding,
                right: 2 == index ? Dimension.size10 : 0,
              ),
              decoration: BoxDecoration(
                color: Themes.white,
                borderRadius: BorderRadius.circular(Dimension.size8),
                boxShadow: Themes.defaultShadow,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/demo/trending$index.png',
                          width: width,
                          height: Get.height * 0.20,
                          fit: BoxFit.contain,
                        ),
                        Divider(
                          height: 2,
                          color: Themes.grey.withOpacity(0.1),
                          thickness: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Trending Items $index',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                            fontWeight: Dimension.textBold),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: RichText(
                                      text: TextSpan(
                                        text:
                                            '${AppConstant.currencySymbol}120/ ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        children: [
                                          TextSpan(
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                .copyWith(color: Themes.grey),
                                            text: 'kg',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        'assets/icons/cart-outline.svg',
                                        height: Dimension.size16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: width,
                      padding: EdgeInsets.all(Dimension.size10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Themes.primary2,
                              borderRadius:
                                  BorderRadius.circular(Dimension.size5),
                            ),
                            padding: EdgeInsets.all(
                              Dimension.size3,
                            ).copyWith(
                                left: Dimension.size10,
                                right: Dimension.size10),
                            child: Text(
                              '30% ${language.off}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      color: Themes.white,
                                      fontSize: Dimension.textSizeSmallExtra),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/favorite-outline.svg',
                              height: Dimension.size20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

List category = ['All', 'Grocery', 'Fruit', 'Vegetables'];
Widget allCategory() {
  return Container(
    height: Dimension.size70,
    margin: EdgeInsets.only(top: Dimension.size5),
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      children: category
          .asMap()
          .map((index, e) => MapEntry(index, singleCategory(e, index)))
          .values
          .toList(),
    ),
  );
}

Widget singleCategory(String e, int index) {
  Color color = Themes.randomColor();
  return Column(
    children: [
      Container(
        height: Dimension.size50,
        margin: EdgeInsets.only(
            left: Dimension.size10,
            right: category.length - 1 == index ? Dimension.size10 : 0),
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          left: Dimension.size30,
          right: Dimension.size30,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Dimension.size24),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              blurRadius: Dimension.size10,
              offset: Offset(0, Dimension.size5),
            ),
          ],
        ),
        child: Text(
          e,
          style: TextStyle(
            fontSize: Dimension.textSize,
            fontWeight: Dimension.textMedium,
            color: Themes.white,
          ),
        ),
      ),
    ],
  );
}

Widget allItems(context) {
  //double width = Get.width * 0.4;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Themes.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                ),
                height: Get.height * 0.30,
                width: Get.width * 0.44,
                margin: EdgeInsets.only(top: Dimension.size5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/demo/trending0.png',
                            width: 150,
                            height: Get.height * 0.20,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Themes.grey.withOpacity(0.1),
                          thickness: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Olive oil',
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: Dimension.textSizeSmallExtra,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          '${AppConstant.currencySymbol}120/ ',
                                      style: TextStyle(
                                        color: kTextColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: Dimension.textSizeSmallExtra,
                                      ),
                                      children: [
                                        TextSpan(
                                          style: TextStyle(
                                            color: kSubTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize:
                                                Dimension.textSizeSmallExtra,
                                          ),
                                          text: 'kg',
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/icons/cart-outline.svg',
                                      height: Dimension.size16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(Dimension.size10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/favorite-outline.svg',
                                height: Dimension.size20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Themes.white,
                  borderRadius: BorderRadius.circular(
                    Dimension.size5,
                  ),
                ),
                height: Get.height * 0.30,
                width: Get.width * 0.44,
                margin: EdgeInsets.only(top: Dimension.size5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/demo/trending1.png',
                          width: 150,
                          height: Get.height * 0.20,
                          fit: BoxFit.contain,
                        ),
                        Divider(
                          height: 2,
                          color: Themes.grey.withOpacity(0.1),
                          thickness: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'FaceWash',
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: Dimension.textSizeSmallExtra,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text:
                                              '${AppConstant.currencySymbol}120/ ',
                                          style: TextStyle(
                                            color: kTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize:
                                                Dimension.textSizeSmallExtra,
                                          ),
                                          children: [
                                        TextSpan(
                                            style: TextStyle(
                                              color: kSubTextColor,
                                              fontWeight: FontWeight.normal,
                                              fontSize:
                                                  Dimension.textSizeSmallExtra,
                                            ),
                                            text: 'kg')
                                      ])),
                                  InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/icons/cart-outline.svg',
                                      height: Dimension.size16,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        top: 0,
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.all(Dimension.size10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/favorite-outline.svg',
                                  height: Dimension.size20,
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Themes.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                ),
                height: Get.height * 0.30,
                width: Get.width * 0.44,
                margin: EdgeInsets.only(top: Dimension.size5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/demo/recomended2.png',
                          width: 150,
                          height: Get.height * 0.20,
                          fit: BoxFit.contain,
                        ),
                        Divider(
                          height: 2,
                          color: Themes.grey.withOpacity(0.1),
                          thickness: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Green Apple',
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: Dimension.textSizeSmallExtra,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text:
                                              '${AppConstant.currencySymbol}120/ ',
                                          style: TextStyle(
                                            color: kTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize:
                                                Dimension.textSizeSmallExtra,
                                          ),
                                          children: [
                                        TextSpan(
                                            style: TextStyle(
                                              color: kSubTextColor,
                                              fontWeight: FontWeight.normal,
                                              fontSize:
                                                  Dimension.textSizeSmallExtra,
                                            ),
                                            text: 'kg')
                                      ])),
                                  InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/icons/cart-outline.svg',
                                      height: Dimension.size16,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(Dimension.size10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/favorite-outline.svg',
                                height: Dimension.size20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Themes.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                ),
                height: Get.height * 0.30,
                width: Get.width * 0.44,
                margin: EdgeInsets.only(top: Dimension.size5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/demo/recomended3.png',
                          width: 150,
                          height: Get.height * 0.20,
                          fit: BoxFit.contain,
                        ),
                        Divider(
                          height: 2,
                          color: Themes.grey.withOpacity(0.1),
                          thickness: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'FaceWash',
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: Dimension.textSizeSmallExtra,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          '${AppConstant.currencySymbol}120/ ',
                                      style: TextStyle(
                                        color: kTextColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: Dimension.textSizeSmallExtra,
                                      ),
                                      children: [
                                        TextSpan(
                                            style: TextStyle(
                                              color: kSubTextColor,
                                              fontWeight: FontWeight.normal,
                                              fontSize:
                                                  Dimension.textSizeSmallExtra,
                                            ),
                                            text: 'kg')
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/icons/cart-outline.svg',
                                      height: Dimension.size16,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(Dimension.size10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/favorite-outline.svg',
                                height: Dimension.size20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Themes.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                ),
                height: Get.height * 0.30,
                width: Get.width * 0.44,
                margin: EdgeInsets.only(top: Dimension.size5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/demo/trending0.png',
                          width: 150,
                          height: Get.height * 0.20,
                          fit: BoxFit.contain,
                        ),
                        Divider(
                          height: 2,
                          color: Themes.grey.withOpacity(0.1),
                          thickness: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Ripe Pomegranates',
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: Dimension.textSizeSmallExtra,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          '${AppConstant.currencySymbol}120/ ',
                                      style: TextStyle(
                                        color: kTextColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: Dimension.textSizeSmallExtra,
                                      ),
                                      children: [
                                        TextSpan(
                                            style: TextStyle(
                                              color: kSubTextColor,
                                              fontWeight: FontWeight.normal,
                                              fontSize:
                                                  Dimension.textSizeSmallExtra,
                                            ),
                                            text: 'kg')
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/icons/cart-outline.svg',
                                      height: Dimension.size16,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(Dimension.size10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/favorite-outline.svg',
                                height: Dimension.size20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Themes.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                ),
                height: Get.height * 0.30,
                width: Get.width * 0.44,
                margin: EdgeInsets.only(top: Dimension.size5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/demo/trending1.png',
                          width: 150,
                          height: Get.height * 0.20,
                          fit: BoxFit.contain,
                        ),
                        Divider(
                          height: 2,
                          color: Themes.grey.withOpacity(0.1),
                          thickness: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Ripe Pomegranates',
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: Dimension.textSizeSmallExtra,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text:
                                              '${AppConstant.currencySymbol}120/ ',
                                          style: TextStyle(
                                            color: kTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize:
                                                Dimension.textSizeSmallExtra,
                                          ),
                                          children: [
                                        TextSpan(
                                            style: TextStyle(
                                              color: kSubTextColor,
                                              fontWeight: FontWeight.normal,
                                              fontSize:
                                                  Dimension.textSizeSmallExtra,
                                            ),
                                            text: 'kg')
                                      ])),
                                  InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/icons/cart-outline.svg',
                                      height: Dimension.size16,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(Dimension.size10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/favorite-outline.svg',
                                height: Dimension.size20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Themes.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                ),
                height: Get.height * 0.30,
                width: Get.width * 0.44,
                margin: EdgeInsets.only(top: Dimension.size5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/demo/recomended2.png',
                          width: 150,
                          height: Get.height * 0.20,
                          fit: BoxFit.contain,
                        ),
                        Divider(
                          height: 2,
                          color: Themes.grey.withOpacity(0.1),
                          thickness: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Green Apple',
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: Dimension.textSizeSmallExtra,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          '${AppConstant.currencySymbol}120/ ',
                                      style: TextStyle(
                                        color: kTextColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: Dimension.textSizeSmallExtra,
                                      ),
                                      children: [
                                        TextSpan(
                                            style: TextStyle(
                                              color: kSubTextColor,
                                              fontWeight: FontWeight.normal,
                                              fontSize:
                                                  Dimension.textSizeSmallExtra,
                                            ),
                                            text: 'kg')
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/icons/cart-outline.svg',
                                      height: Dimension.size16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(Dimension.size10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/favorite-outline.svg',
                                height: Dimension.size20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Themes.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                ),
                height: Get.height * 0.30,
                width: Get.width * 0.44,
                margin: EdgeInsets.only(top: Dimension.size5),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/demo/recomended3.png',
                          width: 150,
                          height: Get.height * 0.20,
                          fit: BoxFit.contain,
                        ),
                        Divider(
                          height: 2,
                          color: Themes.grey.withOpacity(0.1),
                          thickness: 2,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Ripe Pomegranates',
                                    style: TextStyle(
                                      color: kTextColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: Dimension.textSizeSmallExtra,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          '${AppConstant.currencySymbol}120/ ',
                                      style: TextStyle(
                                        color: kTextColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: Dimension.textSizeSmallExtra,
                                      ),
                                      children: [
                                        TextSpan(
                                          style: TextStyle(
                                            color: kSubTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize:
                                                Dimension.textSizeSmallExtra,
                                          ),
                                          text: 'kg',
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/icons/cart-outline.svg',
                                      height: Dimension.size16,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(Dimension.size10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/favorite-outline.svg',
                                height: Dimension.size20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
      ],
    ),
  );
}

Widget featuredItems(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailsScreen(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 0.2,
                    spreadRadius: 0.0,
                    offset: Offset(0, 1.0), // shadow direction: bottom right
                  ),
                ],
              ),
              width: Get.width * 0.99,
              height: Get.height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        color: kFollowed_BG1,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 0.2,
                            spreadRadius: 0.0,
                            offset: Offset(
                              0,
                              1.0,
                            ), // shadow direction: bottom right
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/demo/trending0.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.withOpacity(.2),
                    thickness: 1,
                    width: 1,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Ripe Pomegranates',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Themes.textColor,
                                    fontSize: Dimension.textSize,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: '${AppConstant.currencySymbol}120/ ',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: Dimension.textSizeSmall,
                                  ),
                                  children: [
                                    TextSpan(
                                      style: TextStyle(
                                        color: kSubTextColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: Dimension.textSizeSmall,
                                      ),
                                      text: 'kg',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/favorite-outline.svg',
                                  height: Dimension.size16,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/cart-outline.svg',
                                  height: Dimension.size16,
                                  color: kSubTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 0.2,
                    spreadRadius: 0.0,
                    offset: Offset(0, 1.0),
                  ),
                ],
              ),
              width: Get.width * 0.99,
              height: Get.height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        color: kFollowed_BG2,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 0.2,
                            spreadRadius: 0.0,
                            offset: Offset(
                                0, 1.0), // shadow direction: bottom right
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/demo/recomended2.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.withOpacity(.2),
                    thickness: 1,
                    width: 1,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  //'Ripe Pomegranates',
                                  'Green Apple',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Themes.textColor,
                                    fontSize: Dimension.textSize,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: '${AppConstant.currencySymbol}120/ ',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: Dimension.textSizeSmall,
                                  ),
                                  children: [
                                    TextSpan(
                                      style: TextStyle(
                                        color: kSubTextColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: Dimension.textSizeSmall,
                                      ),
                                      text: 'kg',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/favorite-outline.svg',
                                  height: Dimension.size16,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/cart-outline.svg',
                                  height: Dimension.size16,
                                  color: kSubTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 0.2,
                    spreadRadius: 0.0,
                    offset: Offset(0, 1.0),
                  )
                ],
              ),
              width: Get.width * 0.99,
              height: Get.height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        color: kFollowed_BG3,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 0.2,
                            spreadRadius: 0.0,
                            offset: Offset(0, 1.0),
                          )
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/demo/recomended3.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.withOpacity(.2),
                    thickness: 1,
                    width: 1,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Green Apple Facewash',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Themes.textColor,
                                    fontSize: Dimension.textSize,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: '${AppConstant.currencySymbol}120/ ',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: Dimension.textSizeSmall,
                                  ),
                                  children: [
                                    TextSpan(
                                      style: TextStyle(
                                        color: kSubTextColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: Dimension.textSizeSmall,
                                      ),
                                      text: 'kg',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/favorite-outline.svg',
                                  height: Dimension.size16,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/cart-outline.svg',
                                  height: Dimension.size16,
                                  color: kSubTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    ),
  );
}
