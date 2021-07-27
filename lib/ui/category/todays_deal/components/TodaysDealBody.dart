import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:mr_mart/Widgets/CustomBanner.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/Language/Language.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:mr_mart/app_components/AppConstant.dart';

class TodaysDealBody extends StatefulWidget {
  final Language language = Language();

  @override
  _TodaysDealBodyState createState() => _TodaysDealBodyState();
}

class _TodaysDealBodyState extends State<TodaysDealBody> {
  String dropdownDeliveryToValue;

  final List<String> dropdownNameList = <String>[
    "High to Low price",
    "Low to High price",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          allCategory(),
          SizedBox(
            height: 15,
          ),
          priceFilter(),
          SizedBox(
            height: 10,
          ),
          todaysDeal(context),
          SizedBox(
            height: 15,
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
                  color: Themes.primary,
                  fontSize: Dimension.textSizeSmall,
                  fontWeight: FontWeight.normal,
                ),
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

Widget todaysDeal(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width * 0.44,
            height: Get.height * 0.28,
            decoration: BoxDecoration(
              color: TodayDeal.todaydeals[1].color.withOpacity(0.8),
              borderRadius: BorderRadius.circular(Dimension.size5),
            ),
            clipBehavior: Clip.antiAlias,
            child: CustomBanner(
              message:
                  "${AppConstant.currencySymbol} ${TodayDeal.todaydeals[1].price} ${Language().only}",
              textStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Themes.white,
                    fontSize: Dimension.textSizeSmallExtra,
                  ),
              color: TodayDeal.todaydeals[1].color,
              location: CustomBannerLocation.topEnd,
              layoutDirection: TextDirection.rtl,
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, top: 20, right: 16, bottom: 6),
                          child: Image.asset(
                            TodayDeal.todaydeals[1].image,
                            height: Get.height * 0.15,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white.withOpacity(0.4),
                          thickness: 1,
                        ),
                        Text(
                          TodayDeal.todaydeals[1].name,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                fontWeight: Dimension.textMedium,
                                color: Themes.white,
                              ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: Get.width * 0.3,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              top: Dimension.size3,
                              bottom: Dimension.size3,
                            ),
                            decoration: BoxDecoration(
                              color: Themes.primary2,
                              borderRadius:
                                  BorderRadius.circular(Dimension.size5),
                            ),
                            child: Text(
                              Language().addToCart,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    color: Themes.white,
                                    fontWeight: Dimension.textMedium,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimension.size5,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: Dimension.size10,
                    right: Dimension.size10,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/favorite-outline.svg',
                        height: Dimension.size16,
                        color: Themes.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: Get.width * 0.44,
            height: Get.height * 0.28,
            decoration: BoxDecoration(
              color: TodayDeal.todaydeals[0].color.withOpacity(0.8),
              borderRadius: BorderRadius.circular(Dimension.size5),
            ),
            clipBehavior: Clip.antiAlias,
            child: CustomBanner(
              message:
                  "${AppConstant.currencySymbol} ${TodayDeal.todaydeals[0].price} ${Language().only}",
              textStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Themes.white, fontSize: Dimension.textSizeSmallExtra),
              color: TodayDeal.todaydeals[1].color,
              location: CustomBannerLocation.topEnd,
              layoutDirection: TextDirection.rtl,
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, top: 20, right: 16, bottom: 6),
                          child: Image.asset(
                            TodayDeal.todaydeals[0].image,
                            height: Get.height * 0.15,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white.withOpacity(0.4),
                          thickness: 1,
                        ),
                        Text(
                          TodayDeal.todaydeals[0].name,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                fontWeight: Dimension.textMedium,
                                color: Themes.white,
                              ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: Get.width * 0.3,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              top: Dimension.size3,
                              bottom: Dimension.size3,
                            ),
                            decoration: BoxDecoration(
                                color: Themes.primary2,
                                borderRadius:
                                    BorderRadius.circular(Dimension.size5)),
                            child: Text(
                              Language().addToCart,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    color: Themes.white,
                                    fontWeight: Dimension.textMedium,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimension.size5,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: Dimension.size10,
                    right: Dimension.size10,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/favorite-outline.svg',
                        height: Dimension.size16,
                        color: Themes.white,
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
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width * 0.44,
            height: Get.height * 0.28,
            decoration: BoxDecoration(
              color: TodayDeal.todaydeals[2].color.withOpacity(0.8),
              borderRadius: BorderRadius.circular(Dimension.size5),
            ),
            clipBehavior: Clip.antiAlias,
            child: CustomBanner(
              message:
                  "${AppConstant.currencySymbol} ${TodayDeal.todaydeals[2].price} ${Language().only}",
              textStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Themes.white,
                    fontSize: Dimension.textSizeSmallExtra,
                  ),
              color: TodayDeal.todaydeals[2].color,
              location: CustomBannerLocation.topEnd,
              layoutDirection: TextDirection.rtl,
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, top: 20, right: 16, bottom: 6),
                          child: Image.asset(
                            TodayDeal.todaydeals[2].image,
                            height: Get.height * 0.15,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white.withOpacity(0.4),
                          thickness: 1,
                        ),
                        Text(
                          TodayDeal.todaydeals[2].name,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                fontWeight: Dimension.textMedium,
                                color: Themes.white,
                              ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: Get.width * 0.3,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              top: Dimension.size3,
                              bottom: Dimension.size3,
                            ),
                            decoration: BoxDecoration(
                                color: Themes.primary2,
                                borderRadius:
                                    BorderRadius.circular(Dimension.size5)),
                            child: Text(
                              Language().addToCart,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    color: Themes.white,
                                    fontWeight: Dimension.textMedium,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimension.size5,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: Dimension.size10,
                    right: Dimension.size10,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/favorite-outline.svg',
                        height: Dimension.size16,
                        color: Themes.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: Get.width * 0.44,
            height: Get.height * 0.28,
            decoration: BoxDecoration(
              color: TodayDeal.todaydeals[3].color.withOpacity(0.8),
              borderRadius: BorderRadius.circular(Dimension.size5),
            ),
            clipBehavior: Clip.antiAlias,
            child: CustomBanner(
              message:
                  "${AppConstant.currencySymbol} ${TodayDeal.todaydeals[3].price} ${Language().only}",
              textStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Themes.white,
                    fontSize: Dimension.textSizeSmallExtra,
                  ),
              color: TodayDeal.todaydeals[3].color,
              location: CustomBannerLocation.topEnd,
              layoutDirection: TextDirection.rtl,
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, top: 20, right: 16, bottom: 6),
                          child: Image.asset(
                            TodayDeal.todaydeals[3].image,
                            height: Get.height * 0.15,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white.withOpacity(0.4),
                          thickness: 1,
                        ),
                        Text(
                          TodayDeal.todaydeals[3].name,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                fontWeight: Dimension.textMedium,
                                color: Themes.white,
                              ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: Get.width * 0.3,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              top: Dimension.size3,
                              bottom: Dimension.size3,
                            ),
                            decoration: BoxDecoration(
                              color: Themes.primary2,
                              borderRadius:
                                  BorderRadius.circular(Dimension.size5),
                            ),
                            child: Text(
                              Language().addToCart,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    color: Themes.white,
                                    fontWeight: Dimension.textMedium,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimension.size5,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: Dimension.size10,
                    right: Dimension.size10,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/favorite-outline.svg',
                        height: Dimension.size16,
                        color: Themes.white,
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
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width * 0.44,
            height: Get.height * 0.28,
            decoration: BoxDecoration(
              color: TodayDeal.todaydeals[4].color.withOpacity(0.8),
              borderRadius: BorderRadius.circular(Dimension.size5),
            ),
            clipBehavior: Clip.antiAlias,
            child: CustomBanner(
              message:
                  "${AppConstant.currencySymbol} ${TodayDeal.todaydeals[4].price} ${Language().only}",
              textStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Themes.white,
                    fontSize: Dimension.textSizeSmallExtra,
                  ),
              color: TodayDeal.todaydeals[4].color,
              location: CustomBannerLocation.topEnd,
              layoutDirection: TextDirection.rtl,
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, top: 20, right: 16, bottom: 6),
                          child: Image.asset(
                            TodayDeal.todaydeals[4].image,
                            height: Get.height * 0.15,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white.withOpacity(0.4),
                          thickness: 1,
                        ),
                        Text(
                          TodayDeal.todaydeals[4].name,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                fontWeight: Dimension.textMedium,
                                color: Themes.white,
                              ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: Get.width * 0.3,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              top: Dimension.size3,
                              bottom: Dimension.size3,
                            ),
                            decoration: BoxDecoration(
                                color: Themes.primary2,
                                borderRadius:
                                    BorderRadius.circular(Dimension.size5)),
                            child: Text(
                              Language().addToCart,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    color: Themes.white,
                                    fontWeight: Dimension.textMedium,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimension.size5,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: Dimension.size10,
                    right: Dimension.size10,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/favorite-outline.svg',
                        height: Dimension.size16,
                        color: Themes.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: Get.width * 0.44,
            height: Get.height * 0.28,
            decoration: BoxDecoration(
              color: TodayDeal.todaydeals[5].color.withOpacity(0.8),
              borderRadius: BorderRadius.circular(Dimension.size5),
            ),
            clipBehavior: Clip.antiAlias,
            child: CustomBanner(
              message:
                  "${AppConstant.currencySymbol} ${TodayDeal.todaydeals[5].price} ${Language().only}",
              textStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Themes.white,
                    fontSize: Dimension.textSizeSmallExtra,
                  ),
              color: TodayDeal.todaydeals[5].color,
              location: CustomBannerLocation.topEnd,
              layoutDirection: TextDirection.rtl,
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, top: 20, right: 16, bottom: 6),
                          child: Image.asset(
                            TodayDeal.todaydeals[5].image,
                            height: Get.height * 0.15,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white.withOpacity(0.4),
                          thickness: 1,
                        ),
                        Text(
                          TodayDeal.todaydeals[5].name,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                fontWeight: Dimension.textMedium,
                                color: Themes.white,
                              ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: Get.width * 0.3,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              top: Dimension.size3,
                              bottom: Dimension.size3,
                            ),
                            decoration: BoxDecoration(
                                color: Themes.primary2,
                                borderRadius:
                                    BorderRadius.circular(Dimension.size5)),
                            child: Text(
                              Language().addToCart,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    color: Themes.white,
                                    fontWeight: Dimension.textMedium,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimension.size5,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: Dimension.size10,
                    right: Dimension.size10,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/favorite-outline.svg',
                        height: Dimension.size16,
                        color: Themes.white,
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
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width * 0.44,
            height: Get.height * 0.28,
            decoration: BoxDecoration(
              color: TodayDeal.todaydeals[6].color.withOpacity(0.8),
              borderRadius: BorderRadius.circular(Dimension.size5),
            ),
            clipBehavior: Clip.antiAlias,
            child: CustomBanner(
              message:
                  "${AppConstant.currencySymbol} ${TodayDeal.todaydeals[6].price} ${Language().only}",
              textStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Themes.white,
                    fontSize: Dimension.textSizeSmallExtra,
                  ),
              color: TodayDeal.todaydeals[6].color,
              location: CustomBannerLocation.topEnd,
              layoutDirection: TextDirection.rtl,
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, top: 20, right: 16, bottom: 6),
                          child: Image.asset(
                            TodayDeal.todaydeals[6].image,
                            height: Get.height * 0.15,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white.withOpacity(0.4),
                          thickness: 1,
                        ),
                        Text(
                          TodayDeal.todaydeals[6].name,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                fontWeight: Dimension.textMedium,
                                color: Themes.white,
                              ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: Get.width * 0.3,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              top: Dimension.size3,
                              bottom: Dimension.size3,
                            ),
                            decoration: BoxDecoration(
                              color: Themes.primary2,
                              borderRadius:
                                  BorderRadius.circular(Dimension.size5),
                            ),
                            child: Text(
                              Language().addToCart,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    color: Themes.white,
                                    fontWeight: Dimension.textMedium,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimension.size5,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: Dimension.size10,
                    right: Dimension.size10,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/favorite-outline.svg',
                        height: Dimension.size16,
                        color: Themes.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: Get.width * 0.44,
            height: Get.height * 0.28,
            decoration: BoxDecoration(
              color: TodayDeal.todaydeals[7].color.withOpacity(0.8),
              borderRadius: BorderRadius.circular(Dimension.size5),
            ),
            clipBehavior: Clip.antiAlias,
            child: CustomBanner(
              message:
                  "${AppConstant.currencySymbol} ${TodayDeal.todaydeals[7].price} ${Language().only}",
              textStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Themes.white,
                    fontSize: Dimension.textSizeSmallExtra,
                  ),
              color: TodayDeal.todaydeals[7].color,
              location: CustomBannerLocation.topEnd,
              layoutDirection: TextDirection.rtl,
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, top: 20, right: 16, bottom: 6),
                          child: Image.asset(
                            TodayDeal.todaydeals[7].image,
                            height: Get.height * 0.15,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white.withOpacity(0.4),
                          thickness: 1,
                        ),
                        Text(
                          TodayDeal.todaydeals[7].name,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                fontWeight: Dimension.textMedium,
                                color: Themes.white,
                              ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: Get.width * 0.3,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              top: Dimension.size3,
                              bottom: Dimension.size3,
                            ),
                            decoration: BoxDecoration(
                              color: Themes.primary2,
                              borderRadius:
                                  BorderRadius.circular(Dimension.size5),
                            ),
                            child: Text(
                              Language().addToCart,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    color: Themes.white,
                                    fontWeight: Dimension.textMedium,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimension.size5,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: Dimension.size10,
                    right: Dimension.size10,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/favorite-outline.svg',
                        height: Dimension.size16,
                        color: Themes.white,
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
        height: 15,
      ),
    ],
  );
}

List<TodayDeal> todayDeal = TodayDeal.todaydeals;

class TodayDeal {
  String image, name;
  int price;
  Color color;

  TodayDeal({this.image, this.name, this.price, this.color});

  static List<TodayDeal> todaydeals = [
    TodayDeal(
        image: 'assets/demo/today-deal0.png',
        name: 'Shampoo',
        price: 100,
        color: Themes.randomColor()),
    TodayDeal(
        image: 'assets/demo/today-deal1.png',
        name: 'Grocery',
        price: 110,
        color: Themes.randomColor()),
    TodayDeal(
        image: 'assets/demo/today-deal2.png',
        name: 'Makeup',
        price: 120,
        color: Themes.randomColor()),
    TodayDeal(
        image: 'assets/demo/today-deal3.png',
        name: 'Camera',
        price: 130,
        color: Themes.randomColor()),
    TodayDeal(
        image: 'assets/demo/today-deal4.png',
        name: 'Technic Soft',
        price: 140,
        color: Themes.randomColor()),
    TodayDeal(
        image: 'assets/demo/today-deal5.png',
        name: 'Health products',
        price: 150,
        color: Themes.randomColor()),
    TodayDeal(
        image: 'assets/demo/today-deal6.png',
        name: 'Cosmetics',
        price: 160,
        color: Themes.randomColor()),
    TodayDeal(
        image: 'assets/demo/today-deal7.png',
        name: 'Cosmetics Beauty',
        price: 170,
        color: Themes.randomColor()),
  ];
}
