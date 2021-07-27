import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'dart:ui';

class TabPastOrderScreen extends StatefulWidget {
  @override
  _TabPastOrderScreenState createState() => _TabPastOrderScreenState();
}

class _TabPastOrderScreenState extends State<TabPastOrderScreen> {
  @override
  Widget build(BuildContext context) {
    int counter = 3;

    void incrementCounter() {
      setState(() {
        if (counter == 99) {
          return null;
        }
        counter++;
      });
    }

    void decrementCounter() {
      setState(() {
        if (counter == 0) {
          return null;
        }
        counter--;
      });
    }

    return Container(
      color: kBackgroundColor,
      child: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: EdgeInsets.all(kDefaultPadding),
              children: [
                cartTextWidget(context),
                cartItemsWidget(
                    context, incrementCounter, counter, decrementCounter),
                SizedBox(height: 15),
                cartTextWidget(context),
                cartItemsWidget2(
                    context, incrementCounter, counter, decrementCounter),
                SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container cartTextWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 1,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(5),
        padding: EdgeInsets.all(kDefaultPadding),
        color: Colors.white,
        dashPattern: [2, 3],
        strokeWidth: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Placed On : 20 june 2020, 05:30pm',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Total Price : \$1400',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Item : 2',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 12),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Order ID : #uy45',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 12),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container cartItemsWidget(BuildContext context, void incrementCounter(),
      int counter, void decrementCounter()) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: Get.width * 0.99,
            height: Get.height * 0.12,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: Get.height * 0.11,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
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
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
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
                                    fontWeight: FontWeight.w700),
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
                                    fontSize: Dimension.textSizeSmall),
                                children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: kSubTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.textSizeSmall),
                                      text: 'kg')
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
                            Flexible(
                              child: Text(
                                'Sub Total: \$360',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(fontSize: 14, height: 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: Colors.grey.withOpacity(.3),
                          ),
                        ),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_drop_up_sharp,
                            color: Colors.grey,
                            size: 25,
                          ),
                          onTap: incrementCounter,
                        ),
                      ),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(
                            color: Colors.grey.withOpacity(.3),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '$counter',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: Colors.grey.withOpacity(.3),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: decrementCounter,
                          child: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.grey,
                            size: 25,
                          ),
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
          Divider(
            height: 1,
            color: Colors.black.withOpacity(.2),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: Get.width * 0.99,
            height: Get.height * 0.12,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: Get.height * 0.11,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/demo/trending2.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                'Orange',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Themes.textColor,
                                    fontSize: Dimension.textSize,
                                    fontWeight: FontWeight.w700),
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
                                    fontSize: Dimension.textSizeSmall),
                                children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: kSubTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.textSizeSmall),
                                      text: 'kg')
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
                            Flexible(
                              child: Text(
                                'Sub Total: \$360',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(fontSize: 14, height: 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3),
                            border:
                                Border.all(color: Colors.grey.withOpacity(.3))),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_drop_up_sharp,
                            color: Colors.grey,
                            size: 25,
                          ),
                          onTap: incrementCounter,
                        ),
                      ),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(
                            color: Colors.grey.withOpacity(.3),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '$counter',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: Colors.grey.withOpacity(.3),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: decrementCounter,
                          child: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.grey,
                            size: 25,
                          ),
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
          Divider(
            height: 1,
            color: Colors.black.withOpacity(.2),
          ),
          SizedBox(
            height: 15,
          ),
          reOrderWidget(context),
        ],
      ),
    );
  }

  Container cartItemsWidget2(BuildContext context, void incrementCounter(),
      int counter, void decrementCounter()) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: Get.width * 0.99,
            height: Get.height * 0.12,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: Get.height * 0.11,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/demo/trending1.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                'Olive Oil',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Themes.textColor,
                                    fontSize: Dimension.textSize,
                                    fontWeight: FontWeight.w700),
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
                                    fontSize: Dimension.textSizeSmall),
                                children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: kSubTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.textSizeSmall),
                                      text: 'kg'),
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
                            Flexible(
                              child: Text(
                                'Sub Total: \$360',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(fontSize: 14, height: 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: Colors.grey.withOpacity(.3),
                          ),
                        ),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_drop_up_sharp,
                            color: Colors.grey,
                            size: 25,
                          ),
                          onTap: incrementCounter,
                        ),
                      ),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(
                            color: Colors.grey.withOpacity(.3),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '$counter',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: Colors.grey.withOpacity(.3),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: decrementCounter,
                          child: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.grey,
                            size: 25,
                          ),
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
          Divider(
            height: 1,
            color: Colors.black.withOpacity(.2),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: Get.width * 0.99,
            height: Get.height * 0.12,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: Get.height * 0.11,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
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
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                'Green Apple',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Themes.textColor,
                                    fontSize: Dimension.textSize,
                                    fontWeight: FontWeight.w700),
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
                                    fontSize: Dimension.textSizeSmall),
                                children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: kSubTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.textSizeSmall),
                                      text: 'kg'),
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
                            Flexible(
                              child: Text(
                                'Sub Total: \$360',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(fontSize: 14, height: 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: Colors.grey.withOpacity(.3),
                          ),
                        ),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_drop_up_sharp,
                            color: Colors.grey,
                            size: 25,
                          ),
                          onTap: incrementCounter,
                        ),
                      ),
                      Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                              color: Colors.grey.withOpacity(.3),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '$counter',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: Colors.grey.withOpacity(.3),
                          ),
                        ),
                        child: GestureDetector(
                            onTap: decrementCounter,
                            child: Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.grey,
                              size: 25,
                            )),
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
          Divider(
            height: 1,
            color: Colors.black.withOpacity(.2),
          ),
          SizedBox(
            height: 15,
          ),
          reOrderWidget(context),
        ],
      ),
    );
  }
}

Container reOrderWidget(BuildContext context) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: Get.width * 0.80,
            height: 65,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: kReOrderBG,
                borderRadius: BorderRadius.circular(Dimension.size5)),
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
                      'assets/icons/order/refresh.svg',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Reorder',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: kPrimaryColor,
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
