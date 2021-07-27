import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'dart:ui';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:get/get.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_mart/Widgets/GridAnimation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mr_mart/Language/Language.dart';

Language language = Language();

class FilterBody extends StatefulWidget {
  @override
  _FilterBodyState createState() => _FilterBodyState();
}

class _FilterBodyState extends State<FilterBody> {
  String dropdownDeliveryToValue;

  final List<String> dropdownNameList = <String>[
    "Amberpet, Hyd",
    "Dilshuknagar, Hyd",
    "Uppal, Hyd",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          topMenu(),
          SizedBox(
            height: 10,
          ),
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
            height: 5,
          ),
          Divider(
            height: 1,
            color: Colors.black.withOpacity(.2),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              'Delivery Type',
              textDirection: TextDirection.ltr,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          deliveryWidget(context),
          SizedBox(
            height: 15,
          ),
          Divider(
            height: 1,
            color: Colors.black.withOpacity(.2),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              'Minimum Order Amount',
              textDirection: TextDirection.ltr,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          minimumOrderItem(),
        ],
      ),
    );
  }

  Container deliveryWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: Get.width * 0.44,
              height: 88,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kActiveOrderTrackBG1,
                borderRadius: BorderRadius.circular(Dimension.size5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/normal_delivery.svg',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Normal Delivery',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: kPrimaryColor2,
                            height: 1,
                            fontWeight: Dimension.textMedium),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: Get.width * 0.44,
              height: 88,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kItemBackgroundColor2,
                borderRadius: BorderRadius.circular(Dimension.size5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/fast_delivery.svg',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Fast Delivery',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: kSubTextColor,
                            height: 1,
                            fontWeight: Dimension.textMedium),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topMenu() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Themes.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimension.size5),
          bottomRight: Radius.circular(Dimension.size5),
        ),
        boxShadow: Themes.defaultShadow2,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 80,
              padding: EdgeInsets.all(Dimension.size10),
              decoration: BoxDecoration(
                color: Themes.cardBackBlueLite,
                borderRadius: BorderRadius.circular(Dimension.size3),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: SvgPicture.asset(
                      'assets/icons/navigation.svg',
                      height: 45,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              language.deliveryTo,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(color: Themes.primary),
                            ),
                          ),
                          Expanded(
                            flex: 1,
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
                              items: dropdownNameList
                                  .map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: kPrimaryColor2,
                borderRadius: BorderRadius.circular(Dimension.size3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/filter_white.svg',
                    height: Dimension.size30,
                  ),
                  SizedBox(
                    height: Dimension.size5,
                  ),
                  Text(
                    language.filter,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
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
            .map(
              (index, e) => MapEntry(
                index,
                singleCategory(e, index),
              ),
            )
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
          padding:
              EdgeInsets.only(left: Dimension.size30, right: Dimension.size30),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(Dimension.size24),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                blurRadius: Dimension.size10,
                offset:
                    Offset(0, Dimension.size5), // changes position of shadow
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
}

Widget minimumOrderItem() {
  double width = Get.width * 0.25;
  return Container(
    height: Get.height * 0.16,
    margin: EdgeInsets.only(top: Dimension.size5),
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      itemCount: 4,
      itemBuilder: (context, index) {
        return gridAnimation(
          column: 3,
          index: index,
          child: Container(
            width: width,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(
              left: Dimension.size10,
              right: 3 == index ? Dimension.size10 : 0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.size8),
              boxShadow: Themes.defaultShadow,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/order/min$index.svg',
                        width: width,
                        height: Get.height * 0.16,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
