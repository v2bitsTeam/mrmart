import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/Language/Language.dart';
import 'dart:ui';

Language language = Language();

class AllShopBody extends StatefulWidget {
  @override
  _AllShopBodyState createState() => _AllShopBodyState();
}

class _AllShopBodyState extends State<AllShopBody> {
  double invisibleHeight = (Get.height * 0.15) * 0.2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text(
                    'Filter By  Category',
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                allCategory(),
                SizedBox(
                  height: 10,
                ),
                allShop(0),
              ],
            ),
          ),
        ],
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
            right: category.length - 1 == index ? Dimension.size10 : 0,
          ),
          alignment: Alignment.center,
          padding:
              EdgeInsets.only(left: Dimension.size30, right: Dimension.size30),
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

  Widget allShop(index) {
    //double width = Get.width * 0.4;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width * 0.44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                  boxShadow: Themes.defaultShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimension.size5),
                          topLeft: Radius.circular(Dimension.size5),
                        ),
                        color: TrendingShop.trendingShops[2].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              TrendingShop.trendingShops[2].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[2].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            TrendingShop.trendingShops[2].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.size3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[2].distance} ${language.kmAway}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[2].rating} (${TrendingShop.trendingShops[2].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 0,
              ),
              Container(
                width: Get.width * 0.44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                  boxShadow: Themes.defaultShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimension.size5),
                          topLeft: Radius.circular(Dimension.size5),
                        ),
                        color: TrendingShop.trendingShops[3].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              TrendingShop.trendingShops[3].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[index].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            TrendingShop.trendingShops[index].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.size3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].distance} ${language.kmAway}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].rating} (${TrendingShop.trendingShops[index].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width * 0.44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                  boxShadow: Themes.defaultShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimension.size5),
                          topLeft: Radius.circular(Dimension.size5),
                        ),
                        color: TrendingShop.trendingShops[index].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              TrendingShop.trendingShops[index].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[index].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            TrendingShop.trendingShops[index].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.size3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].distance} ${language.kmAway}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].rating} (${TrendingShop.trendingShops[index].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 0,
              ),
              Container(
                width: Get.width * 0.44,
                //width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                  boxShadow: Themes.defaultShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimension.size5),
                          topLeft: Radius.circular(Dimension.size5),
                        ),
                        color: TrendingShop.trendingShops[1].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              TrendingShop.trendingShops[1].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[1].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            TrendingShop.trendingShops[1].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.size3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[1].distance} ${language.kmAway}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[1].rating} (${TrendingShop.trendingShops[1].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width * 0.44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                  boxShadow: Themes.defaultShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimension.size5),
                          topLeft: Radius.circular(Dimension.size5),
                        ),
                        color: TrendingShop.trendingShops[3].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              TrendingShop.trendingShops[index].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[index].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            TrendingShop.trendingShops[index].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.size3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].distance} ${language.kmAway}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].rating} (${TrendingShop.trendingShops[index].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 0,
              ),
              Container(
                width: Get.width * 0.44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                  boxShadow: Themes.defaultShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimension.size5),
                          topLeft: Radius.circular(Dimension.size5),
                        ),
                        color: TrendingShop.trendingShops[index].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              TrendingShop.trendingShops[index].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[index].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            TrendingShop.trendingShops[index].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.size3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].distance} ${language.kmAway}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[index].rating} (${TrendingShop.trendingShops[index].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width * 0.44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                  boxShadow: Themes.defaultShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimension.size5),
                          topLeft: Radius.circular(Dimension.size5),
                        ),
                        color: TrendingShop.trendingShops[1].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              TrendingShop.trendingShops[1].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[1].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            TrendingShop.trendingShops[1].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.size3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[1].distance} ${language.kmAway}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[1].rating} (${TrendingShop.trendingShops[1].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 0,
              ),
              Container(
                width: Get.width * 0.44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                  boxShadow: Themes.defaultShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimension.size5),
                          topLeft: Radius.circular(Dimension.size5),
                        ),
                        color: TrendingShop.trendingShops[2].color,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              TrendingShop.trendingShops[0].image,
                              width: 120,
                              height: Get.height * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Text(
                            TrendingShop.trendingShops[index].name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            TrendingShop.trendingShops[2].details,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: Dimension.size3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/distance.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size4,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[2].distance} ${language.kmAway}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/rating.svg',
                                      height: Dimension.size12,
                                    ),
                                    SizedBox(
                                      width: Dimension.size5,
                                    ),
                                    Text(
                                      '${TrendingShop.trendingShops[1].rating} (${TrendingShop.trendingShops[1].totalRating})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class TrendingShop {
  String image, name, details;
  int distance, totalRating;
  double rating;
  Color color;

  TrendingShop({
    this.image,
    this.name,
    this.details,
    this.distance,
    this.totalRating,
    this.rating,
    this.color,
  });

  static List<TrendingShop> trendingShops = [
    TrendingShop(
      image: 'assets/demo/trending-shop0.png',
      name: 'K & K Stationary',
      details: 'nulla ftum vitae',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG1,
    ),
    TrendingShop(
      image: 'assets/demo/trending-shop1.png',
      name: 'Giant Food Stores.',
      details: 'Aenan nulla tae',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG5,
    ),
    TrendingShop(
      image: 'assets/demo/trending-shop2.png',
      name: 'Stationary K',
      details: 'Aenan  ferme ntum ve',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG2,
    ),
    TrendingShop(
      image: 'assets/demo/trending-shop3.png',
      name: 'K & K Stationary',
      details: 'ulla ferme ntum',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG3,
    ),
    TrendingShop(
      image: 'assets/demo/trending-shop4.png',
      name: 'K & K Stationary',
      details: 'Austo nulla ferum',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG4,
    ),
  ];
  static List<TrendingShop> allShop = [
    TrendingShop(
      image: 'assets/demo/shop0.png',
      name: 'Giant Food Stores.',
      details: 'Abf juerme ntum vitae',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG5,
    ),
    TrendingShop(
        image: 'assets/demo/shop1.png',
        name: 'K & K Stationary',
        details: 'Qusto   ntum vitae',
        distance: 5,
        rating: 4.8,
        totalRating: 520,
        color: Themes.randomColor()),
    TrendingShop(
        image: 'assets/demo/shop2.png',
        name: 'Giant Food Stores.',
        details: 'Zusto  ntum vitae',
        distance: 5,
        rating: 4.8,
        totalRating: 520,
        color: Themes.randomColor()),
    TrendingShop(
        image: 'assets/demo/shop3.png',
        name: 'K & K Stationary',
        details: 'Aenan justo nulla',
        distance: 5,
        rating: 4.8,
        totalRating: 520,
        color: Themes.randomColor()),
    TrendingShop(
        image: 'assets/demo/shop4.png',
        name: 'K & K Stationary',
        details: 'Msto nulla fe vitae',
        distance: 5,
        rating: 4.8,
        totalRating: 520,
        color: Themes.randomColor()),
  ];
}
