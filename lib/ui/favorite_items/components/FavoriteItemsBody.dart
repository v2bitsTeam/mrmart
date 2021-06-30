import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:MrMart/ui_components/CustomDeleteDialog.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/app_components/AppConstant.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/Dimension.dart';

class FavoriteItemsBody extends StatefulWidget {
  @override
  _FavoriteItemsBodyState createState() => _FavoriteItemsBodyState();
}

double invisibleHeight = (Get.height * 0.15) * 0.2;

class _FavoriteItemsBodyState extends State<FavoriteItemsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: EdgeInsets.only(
                  top: invisibleHeight + Dimension.Size_6 + Dimension.Size_6,
                  left: 16,
                  right: 16),
              //padding: EdgeInsets.all(kDefaultPadding),
              children: [
                favoriteItems(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget favoriteItems() {
    //double width = Get.width * 0.4;

    int counter = 1;

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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          child: Container(
            width: Get.width * 0.99,
            height: Get.height * 0.18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Image.asset(
                      'assets/demo/trending0.png',
                      //width: Get.width * 0.2,
                      fit: BoxFit.contain,
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
                  flex: 4,
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
                                'Ripe Pomegranates',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Themes.Text_Color,
                                    fontSize: Dimension.Text_Size,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
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
                                        fontSize: Dimension.Text_Size_Small),
                                    children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: kSubTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.Text_Size_Small),
                                      text: 'kg')
                                ])),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/cart-outline.svg',
                                height: Dimension.Size_16,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CustomDeleteDialog());
                              },
                              child: SvgPicture.asset(
                                'assets/icons/delete.svg',
                                height: Dimension.Size_16,
                                color: kSubTextColor,
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
                  child: Padding(
                    padding: EdgeInsets.only(right: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3))),
                          child: InkWell(
                            child: Icon(
                              Icons.arrow_drop_up_sharp,
                              color: Colors.grey,
                              size: 30,
                            ),
                            onTap: incrementCounter,
                          ),
                        ),
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(.3))),
                            //margin: EdgeInsets.only(left: 6, right: 6),
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
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3))),
                          child: GestureDetector(
                              onTap: decrementCounter,
                              child: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.grey,
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Card(
          child: Container(
            width: Get.width * 0.99,
            height: Get.height * 0.18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Image.asset(
                      'assets/demo/recomended2.png',
                      //width: Get.width * 0.2,
                      fit: BoxFit.contain,
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
                  flex: 4,
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
                                    color: Themes.Text_Color,
                                    fontSize: Dimension.Text_Size,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
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
                                        fontSize: Dimension.Text_Size_Small),
                                    children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: kSubTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.Text_Size_Small),
                                      text: 'kg')
                                ])),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/cart-outline.svg',
                                height: Dimension.Size_16,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CustomDeleteDialog());
                              },
                              child: SvgPicture.asset(
                                'assets/icons/delete.svg',
                                height: Dimension.Size_16,
                                color: kSubTextColor,
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
                  child: Padding(
                    padding: EdgeInsets.only(right: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3))),
                          child: InkWell(
                            child: Icon(
                              Icons.arrow_drop_up_sharp,
                              color: Colors.grey,
                              size: 30,
                            ),
                            onTap: incrementCounter,
                          ),
                        ),
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(.3))),
                            //margin: EdgeInsets.only(left: 6, right: 6),
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
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3))),
                          child: GestureDetector(
                              onTap: decrementCounter,
                              child: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.grey,
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Card(
          child: Container(
            width: Get.width * 0.99,
            height: Get.height * 0.18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Image.asset(
                      'assets/demo/recomended3.png',
                      //width: Get.width * 0.2,
                      fit: BoxFit.contain,
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
                  flex: 4,
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
                                'Green Apple Facewash',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Themes.Text_Color,
                                    fontSize: Dimension.Text_Size,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
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
                                        fontSize: Dimension.Text_Size_Small),
                                    children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: kSubTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.Text_Size_Small),
                                      text: 'kg')
                                ])),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/cart-outline.svg',
                                height: Dimension.Size_16,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CustomDeleteDialog());
                              },
                              child: SvgPicture.asset(
                                'assets/icons/delete.svg',
                                height: Dimension.Size_16,
                                color: kSubTextColor,
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
                  child: Padding(
                    padding: EdgeInsets.only(right: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3))),
                          child: InkWell(
                            child: Icon(
                              Icons.arrow_drop_up_sharp,
                              color: Colors.grey,
                              size: 30,
                            ),
                            onTap: incrementCounter,
                          ),
                        ),
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(.3))),
                            //margin: EdgeInsets.only(left: 6, right: 6),
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
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3))),
                          child: GestureDetector(
                              onTap: decrementCounter,
                              child: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.grey,
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Card(
          child: Container(
            width: Get.width * 0.99,
            height: Get.height * 0.18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Image.asset(
                      'assets/demo/recomended1.png',
                      //width: Get.width * 0.2,
                      fit: BoxFit.contain,
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
                  flex: 4,
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
                                'Ripe Papaye',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Themes.Text_Color,
                                    fontSize: Dimension.Text_Size,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
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
                                        fontSize: Dimension.Text_Size_Small),
                                    children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: kSubTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.Text_Size_Small),
                                      text: 'kg')
                                ])),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/cart-outline.svg',
                                height: Dimension.Size_16,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CustomDeleteDialog());
                              },
                              child: SvgPicture.asset(
                                'assets/icons/delete.svg',
                                height: Dimension.Size_16,
                                color: kSubTextColor,
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
                  child: Padding(
                    padding: EdgeInsets.only(right: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3))),
                          child: InkWell(
                            child: Icon(
                              Icons.arrow_drop_up_sharp,
                              color: Colors.grey,
                              size: 30,
                            ),
                            onTap: incrementCounter,
                          ),
                        ),
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(.3))),
                            //margin: EdgeInsets.only(left: 6, right: 6),
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
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3))),
                          child: GestureDetector(
                              onTap: decrementCounter,
                              child: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.grey,
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Card(
          child: Container(
            width: Get.width * 0.99,
            height: Get.height * 0.18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Image.asset(
                      'assets/demo/recomended4.png',
                      //width: Get.width * 0.2,
                      fit: BoxFit.contain,
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
                  flex: 4,
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
                                'Microfiber Hand',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Themes.Text_Color,
                                    fontSize: Dimension.Text_Size,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
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
                                        fontSize: Dimension.Text_Size_Small),
                                    children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: kSubTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.Text_Size_Small),
                                      text: 'kg')
                                ])),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/cart-outline.svg',
                                height: Dimension.Size_16,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CustomDeleteDialog());
                              },
                              child: SvgPicture.asset(
                                'assets/icons/delete.svg',
                                height: Dimension.Size_16,
                                color: kSubTextColor,
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
                  child: Padding(
                    padding: EdgeInsets.only(right: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3))),
                          child: InkWell(
                            child: Icon(
                              Icons.arrow_drop_up_sharp,
                              color: Colors.grey,
                              size: 30,
                            ),
                            onTap: incrementCounter,
                          ),
                        ),
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(.3))),
                            //margin: EdgeInsets.only(left: 6, right: 6),
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
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3))),
                          child: GestureDetector(
                              onTap: decrementCounter,
                              child: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.grey,
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Card(
          child: Container(
            width: Get.width * 0.99,
            height: Get.height * 0.18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Image.asset(
                      'assets/demo/recomended5.png',
                      //width: Get.width * 0.2,
                      fit: BoxFit.contain,
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
                  flex: 4,
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
                                'Olive Oil',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Themes.Text_Color,
                                    fontSize: Dimension.Text_Size,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
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
                                        fontSize: Dimension.Text_Size_Small),
                                    children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: kSubTextColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Dimension.Text_Size_Small),
                                      text: 'kg')
                                ])),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/cart-outline.svg',
                                height: Dimension.Size_16,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CustomDeleteDialog());
                              },
                              child: SvgPicture.asset(
                                'assets/icons/delete.svg',
                                height: Dimension.Size_16,
                                color: kSubTextColor,
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
                  child: Padding(
                    padding: EdgeInsets.only(right: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3))),
                          child: InkWell(
                            child: Icon(
                              Icons.arrow_drop_up_sharp,
                              color: Colors.grey,
                              size: 30,
                            ),
                            onTap: incrementCounter,
                          ),
                        ),
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(.3))),
                            //margin: EdgeInsets.only(left: 6, right: 6),
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
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3))),
                          child: GestureDetector(
                              onTap: decrementCounter,
                              child: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.grey,
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
