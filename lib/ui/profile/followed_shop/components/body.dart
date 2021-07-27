import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:mr_mart/Widgets/GridAnimation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 15,
          ),
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
    crossAxisCount: 6,
    mainAxisSpacing: Dimension.size8,
    crossAxisSpacing: Dimension.size8,
    itemBuilder: (context, index) {
      return gridAnimation(
          column: 3,
          index: index,
          child: Container(
            decoration: BoxDecoration(
              color: Themes.white,
              borderRadius: BorderRadius.circular(Dimension.size5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FollowedShop.followedShop[index].bgColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimension.size5),
                      topRight: Radius.circular(Dimension.size5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: kDefaultPadding2,
                      top: kDefaultPadding2,
                      right: kDefaultPadding2,
                      bottom: 0,
                    ),
                    child: Center(
                      child: Image.asset(
                        FollowedShop.followedShop[index].image,
                        fit: BoxFit.contain,
                        height: Get.height * 0.1,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(Dimension.size10)
                      .copyWith(top: Dimension.size5, bottom: Dimension.size5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        FollowedShop.followedShop[index].name,
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

  static List<FollowedShop> followedShop = [
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
