import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:MrMart/app_components/AppConstant.dart';
import 'package:MrMart/Widgets/GridAnimation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Followed Shop',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 1,
            ),
          ),
          //TitleWithClearAllBtn(text: "Today", press: () {}),
          SizedBox(
            height: 15,
          ),
          //trendingItem(),
          recommendedItem(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
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
