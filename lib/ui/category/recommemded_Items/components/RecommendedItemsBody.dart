import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:MrMart/app_components/AppConstant.dart';
import 'package:MrMart/Widgets/GridAnimation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

class RecommendedItemsBody extends StatefulWidget {
  @override
  _RecommendedItemsBodyState createState() => _RecommendedItemsBodyState();
}

class _RecommendedItemsBodyState extends State<RecommendedItemsBody> {
  bool isExpanded = false;

  String dropdownDeliveryToValue;
  final List<String> dropdownNameList = <String>[
    "High to Low price",
    "Low to High price",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          allCategory(),
          SizedBox(
            height: 15,
          ),
          //trendingItem(),
          priceFilter(),
          SizedBox(
            height: 10,
          ),
          recommendedItem(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  priceFilter() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kItemBackgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        value: dropdownDeliveryToValue == null
            ? dropdownNameList[0]
            : dropdownDeliveryToValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 18,
        iconDisabledColor: kBlueTextColor,
        iconEnabledColor: kBlueTextColor,
        style: TextStyle(color: kBlueTextColor),
        underline: Container(
          height: 0,
          color: Colors.transparent,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownDeliveryToValue = newValue;
          });
        },
        items: dropdownNameList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              width: 260,
              child: Text(
                value,
                style: TextStyle(
                    color: Themes.Primary,
                    fontSize: Dimension.Text_Size_Small,
                    fontWeight: FontWeight.normal),
                //style: Theme.of(context).textTheme.headline4,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

List category = ['All', 'Grocery', 'Fruit', 'Vegetables'];

Widget allCategory() {
  return Container(
    height: Dimension.Size_70,
    margin: EdgeInsets.only(top: Dimension.Size_5),
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
        height: Dimension.Size_50,
        margin: EdgeInsets.only(
            left: Dimension.Size_10,
            right: category.length - 1 == index ? Dimension.Size_10 : 0),
        alignment: Alignment.center,
        padding:
            EdgeInsets.only(left: Dimension.Size_30, right: Dimension.Size_30),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Dimension.Size_24),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              blurRadius: Dimension.Size_10,
              offset: Offset(0, Dimension.Size_5), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          e,
          style: TextStyle(
              fontSize: Dimension.Text_Size,
              fontWeight: Dimension.textMedium,
              color: Themes.White),
        ),
      ),
    ],
  );
}

Widget recommendedItem() {
  return StaggeredGridView.countBuilder(
    primary: false,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: 6,
    //padding: EdgeInsets.only(left: Dimension.Size_10, right: Dimension.Size_10),
    crossAxisCount: 6,
    mainAxisSpacing: Dimension.Size_8,
    crossAxisSpacing: Dimension.Size_8,
    itemBuilder: (context, index) {
      return GridAnimation(
          column: 3,
          index: index,
          child: Container(
            decoration: BoxDecoration(
              color: Themes.White,
              borderRadius: BorderRadius.circular(Dimension.Size_5),
              //boxShadow: Themes.defaultShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FollowedShop.followed_shop[index].bgColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimension.Size_5),
                      topRight: Radius.circular(Dimension.Size_5),
                    ),
                    //boxShadow: Themes.defaultShadow,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: kDefaultPadding2,
                        top: kDefaultPadding2,
                        right: kDefaultPadding2,
                        bottom: 0),
                    child: Center(
                      child: Image.asset(
                        FollowedShop.followed_shop[index].image,
                        fit: BoxFit.contain,
                        height: Get.height * 0.1,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(Dimension.Size_10).copyWith(
                      top: Dimension.Size_5, bottom: Dimension.Size_5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        FollowedShop.followed_shop[index].name,
                        style: Theme.of(context).textTheme.bodyText2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    },
    staggeredTileBuilder: (index) => StaggeredTile.fit(2),
  );
}

class FollowedShop {
  String image, name;
  Color bgColor;

  FollowedShop({
    this.image,
    this.name,
    this.bgColor,
  });

  static List<FollowedShop> followed_shop = [
    FollowedShop(
      image: 'assets/images/shop/followed_shop_1.png',
      name: 'Stop & Shop.',
      bgColor: kFollowed_BG1,
    ),
    FollowedShop(
      image: 'assets/images/shop/followed_shop_2.png',
      name: 'Sweet Cake',
      bgColor: kFollowed_BG2,
    ),
    FollowedShop(
      image: 'assets/images/shop/followed_shop_3.png',
      name: 'H & N Corners',
      bgColor: kFollowed_BG3,
    ),
    FollowedShop(
      image: 'assets/images/shop/followed_shop_4.png',
      name: 'Cake N Bake',
      bgColor: kFollowed_BG4,
    ),
    FollowedShop(
      image: 'assets/images/shop/followed_shop_1.png',
      name: 'Microfiber Hand',
      bgColor: kFollowed_BG1,
    ),
    FollowedShop(
      image: 'assets/images/shop/followed_shop_5.png',
      name: 'Fruits House',
      bgColor: kFollowed_BG5,
    ),
  ];
}

/*class FollowedShop {
  String image, name;
  Color bgColor;

  FollowedShop({this.image, this.name, this.bgColor});

  static List<FollowedShop> followed_shop = [
    FollowedShop(
      image: 'assets/images/shop/followed_shop_1.png',
      name: 'Stop & Shop.',
      bgColor: kFollowed_BG1,
    ),
    FollowedShop(
      image: 'assets/images/shop/followed_shop_2.png',
      name: 'Sweet Cake',
      bgColor: kFollowed_BG2,
    ),
    FollowedShop(
      image: 'assets/images/shop/followed_shop_3.png',
      name: 'H & N Corners',
      bgColor: kFollowed_BG3,
    ),
    FollowedShop(
      image: 'assets/images/shop/followed_shop_4.png',
      name: 'Cake N Bake',
      bgColor: kFollowed_BG4,
    ),
    FollowedShop(
      image: 'assets/images/shop/followed_shop_1.png',
      name: 'Microfiber Hand',
      bgColor: kFollowed_BG1,
    ),
    FollowedShop(
      image: 'assets/images/shop/followed_shop_5.png',
      name: 'Fruits House',
      bgColor: kFollowed_BG5,
    ),
  ];
}*/
/*
Widget trendingItem() {
  double width = Get.width * 0.4;
  return Container(
    height: Get.height * 0.25,
    margin: EdgeInsets.only(top: Dimension.Size_5),
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      itemCount: 3,
      itemBuilder: (context, index) {
        return GridAnimation(
          column: 3,
          index: index,
          child: Container(
            width: width,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(
                left: Dimension.Size_10,
                bottom: Dimension.Padding,
                right: 2 == index ? Dimension.Size_10 : 0),
            decoration: BoxDecoration(
              color: Themes.White,
              borderRadius: BorderRadius.circular(Dimension.Size_8),
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
                        height: Get.height * 0.15,
                        fit: BoxFit.cover,
                      ),
                      Divider(
                        height: 2,
                        color: Themes.Grey.withOpacity(0.1),
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
                                  'Ripe Pomegranates',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontWeight: Dimension.textBold),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex:4,
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
                                                    .copyWith(color: Themes.Grey),
                                                text: 'kg')
                                          ])),
                                ),
                                Expanded(
                                  flex:1,
                                  child: InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/icons/cart-fill-color.svg',
                                      height: Dimension.Size_16,
                                    ),
                                  ),
                                )
                              ],
                            )
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
                      padding: EdgeInsets.all(Dimension.Size_10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Themes.Primary2,
                                borderRadius:
                                BorderRadius.circular(Dimension.Size_5)),
                            padding: EdgeInsets.all(Dimension.Size_3)
                                .copyWith(
                                left: Dimension.Size_10,
                                right: Dimension.Size_10),
                            child: Text(
                              '30',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                  color: Themes.White,
                                  fontSize:
                                  Dimension.Text_Size_Small_Extra),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/favorite-outline.svg',
                              height: Dimension.Size_20,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    ),
  );
}*/
