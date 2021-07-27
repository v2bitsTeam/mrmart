import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mr_mart/app_components/Dimension.dart';

class FavoriteItemHeaderBody extends StatefulWidget {
  @override
  _FavoriteItemHeaderBodyState createState() => _FavoriteItemHeaderBodyState();
}

class _FavoriteItemHeaderBodyState extends State<FavoriteItemHeaderBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: EdgeInsets.only(top: 0, left: 16, right: 16),
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
                                      fontSize: Dimension.textSizeSmall,
                                    ),
                                    children: [
                                  TextSpan(
                                      style: TextStyle(
                                        color: kSubTextColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: Dimension.textSizeSmall,
                                      ),
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
                                'assets/icons/cart-fill-color.svg',
                                height: Dimension.size16,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/delete.svg',
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
                              color: Colors.grey.withOpacity(.3),
                            ),
                          ),
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
                            )),
                        Container(
                          height: 30,
                          width: 30,
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
                              size: 30,
                            ),
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
                                      fontSize: Dimension.textSizeSmall,
                                    ),
                                    children: [
                                  TextSpan(
                                      style: TextStyle(
                                        color: kSubTextColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: Dimension.textSizeSmall,
                                      ),
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
                                'assets/icons/cart-fill-color.svg',
                                height: Dimension.size16,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/delete.svg',
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
                              color: Colors.grey.withOpacity(.3),
                            ),
                          ),
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
                            )),
                        Container(
                          height: 30,
                          width: 30,
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
                              size: 30,
                            ),
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
                          height: 15,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/cart-fill-color.svg',
                                height: Dimension.size16,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/delete.svg',
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
                              color: Colors.grey.withOpacity(.3),
                            ),
                          ),
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
                            ),
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
                                'Ripe Papaye',
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
                          height: 15,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/cart-fill-color.svg',
                                height: Dimension.size16,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/delete.svg',
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
                              color: Colors.grey.withOpacity(.3),
                            ),
                          ),
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
                          height: 30,
                          width: 30,
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
                              size: 30,
                            ),
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
                                'Microfiber Hand',
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
                          height: 15,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/cart-fill-color.svg',
                                height: Dimension.size16,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/delete.svg',
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
                              color: Colors.grey.withOpacity(.3),
                            ),
                          ),
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
                            )),
                        Container(
                          height: 30,
                          width: 30,
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
                              size: 30,
                            ),
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
                                'Olive Oil',
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
                                  fontSize: Dimension.textSizeSmall,
                                ),
                                children: [
                                  TextSpan(
                                      style: TextStyle(
                                        color: kSubTextColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: Dimension.textSizeSmall,
                                      ),
                                      text: 'kg')
                                ],
                              ),
                            ),
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
                                'assets/icons/cart-fill-color.svg',
                                height: Dimension.size16,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/delete.svg',
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
                              color: Colors.grey.withOpacity(.3),
                            ),
                          ),
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
                            )),
                        Container(
                          height: 30,
                          width: 30,
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
                              size: 30,
                            ),
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
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
