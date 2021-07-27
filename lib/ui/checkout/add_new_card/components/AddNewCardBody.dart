import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'dart:ui';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:get/get.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/Widgets/GridAnimation.dart';
import 'package:mr_mart/ui_components/default_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddNewCardBody extends StatefulWidget {
  @override
  _AddNewCardBodyState createState() => _AddNewCardBodyState();
}

class _AddNewCardBodyState extends State<AddNewCardBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          bankCardItem(),
          Positioned(
            top: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, .0),
              child: Row(
                children: [
                  Text(
                    'Add Card Details Info',
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          newCardDetailsView(context),
        ],
      ),
    );
  }
}

Widget newCardDetailsView(context) {
  return ListView(
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    children: [
      Container(
        padding: EdgeInsets.all(Dimension.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: kSubTextColor),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: kSubTextColor.withOpacity(.3)))),
              child: TextField(
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.headline1,
                cursorColor: Colors.black,
                inputFormatters: [],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Rahul Subramaniam",
                  hintStyle: TextStyle(
                    color: kTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Number',
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: kSubTextColor),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: kSubTextColor.withOpacity(.3),
                  ),
                ),
              ),
              child: TextField(
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.headline1,
                cursorColor: Colors.black,
                inputFormatters: [],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "0000 - 0000 - 0000 - 0000",
                  hintStyle: TextStyle(
                    color: kTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expiry Date',
                              textDirection: TextDirection.ltr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(color: kSubTextColor),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: kSubTextColor.withOpacity(.3),
                            ),
                          ),
                        ),
                        child: TextField(
                          textDirection: TextDirection.ltr,
                          style: Theme.of(context).textTheme.headline1,
                          cursorColor: Colors.black,
                          inputFormatters: [],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "mm/yy",
                            hintStyle: TextStyle(
                              color: kTextColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CVC',
                              textDirection: TextDirection.ltr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(color: kSubTextColor),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: kSubTextColor.withOpacity(.3),
                            ),
                          ),
                        ),
                        child: TextField(
                          textDirection: TextDirection.ltr,
                          style: Theme.of(context).textTheme.headline1,
                          cursorColor: Colors.black,
                          inputFormatters: [],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "***",
                            hintStyle: TextStyle(
                              color: kTextColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: DefaultButton(
          text: "Save",
          press: () {
            Get.toNamed(MAIN_PAGE);
          },
        ),
      ),
    ],
  );
}

Widget bankCardItem() {
  double width = Get.width * 0.4;
  return Container(
    height: Get.height * 0.26,
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
                right: 3 == index ? Dimension.size10 : 0),
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
                        'assets/icons/card$index.svg',
                        width: width,
                        height: Get.height * 0.26,
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
