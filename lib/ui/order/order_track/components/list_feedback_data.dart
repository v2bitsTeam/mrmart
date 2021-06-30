import 'package:flutter/material.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/ui/order/order_track/order_track_screen.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:get/get.dart';
import 'package:MrMart/Route/Route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget getFeedBackListView() {
  return Container(
    color: Colors.white,
    child: ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(
              left: kDefaultPadding,
              top: 10,
              right: kDefaultPadding,
              bottom: 5),
          title: Text(
            "Satisfied",
            style:
                TextStyle(fontSize: kDefaultFontSizeTitle, color: kTextColor),
          ),
          leading: ShapeOfView(
            height: 50,
            width: 50,
            shape: RoundRectShape(
              borderRadius: BorderRadius.circular(13),
              borderColor: Colors.black, //optional
              borderWidth: 0, //optional
            ),
            child: Container(
              color: kfeedback_bg1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.asset('assets/icons/order/feedback1.svg',
                    color: Colors.white, semanticsLabel: ''),
              ),
            ),
          ),
          trailing: Icon(
            Icons.check_circle,
            color: kPrimaryColor,
            size: 30,
          ),
          onTap: () {
            Get.toNamed(ORDER_TRACK_SCREEN);
          },
        ),
        Divider(
          color: kDividerLine,
          thickness: 2,
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(
              left: kDefaultPadding, top: 5, right: kDefaultPadding, bottom: 5),
          title: Text(
            "Average",
            style:
                TextStyle(fontSize: kDefaultFontSizeTitle, color: kTextColor),
          ),
          leading: ShapeOfView(
            height: 50,
            width: 50,
            shape: RoundRectShape(
              borderRadius: BorderRadius.circular(13),
              borderColor: Colors.black, //optional
              borderWidth: 0, //optional
            ),
            child: Container(
              color: kfeedback_bg2,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.asset('assets/icons/order/feedback2.svg',
                    color: Colors.white, semanticsLabel: ''),
              ),
            ),
          ),
          onTap: () {
            Get.toNamed(ORDER_TRACK_SCREEN);
          },
        ),
        Divider(
          color: kDividerLine,
          thickness: 2,
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(
              left: kDefaultPadding, top: 5, right: kDefaultPadding, bottom: 5),
          title: Text(
            "Not Satisfied",
            style:
                TextStyle(fontSize: kDefaultFontSizeTitle, color: kTextColor),
          ),
          leading: ShapeOfView(
            height: 50,
            width: 50,
            shape: RoundRectShape(
              borderRadius: BorderRadius.circular(13),
              borderColor: Colors.black, //optional
              borderWidth: 0, //optional
            ),
            child: Container(
              color: kfeedback_bg3,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.asset('assets/icons/order/feedback3.svg',
                    color: Colors.white, semanticsLabel: ''),
              ),
            ),
          ),
          onTap: () {
            Get.toNamed(ORDER_TRACK_SCREEN);
          },
        ),
        Divider(
          color: kDividerLine,
          thickness: 2,
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(
              left: kDefaultPadding, top: 5, right: kDefaultPadding, bottom: 5),
          title: Text(
            "Disappointing",
            style:
                TextStyle(fontSize: kDefaultFontSizeTitle, color: kTextColor),
          ),
          leading: ShapeOfView(
            height: 50,
            width: 50,
            shape: RoundRectShape(
              borderRadius: BorderRadius.circular(13),
              borderColor: Colors.black, //optional
              borderWidth: 0, //optional
            ),
            child: Container(
              color: kfeedback_bg4,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.asset('assets/icons/order/feedback4.svg',
                    color: Colors.white, semanticsLabel: ''),
              ),
            ),
          ),
          onTap: () {
            Get.toNamed(ORDER_TRACK_SCREEN);
          },
        ),
        Divider(
          color: kDividerLine,
          thickness: 2,
        ),
        SizedBox(
          height: 10,
        )
      ],
    ),
  );
/*  var cardView = ListView(
    shrinkWrap: true,
    children: [
      ListTile(
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        title: Text(
          "Satisfied",
          style:
          TextStyle(fontSize: kDefaultFontSizeTitle, color: kTextColor),
        ),
        leading: ShapeOfView(
          height: 50,
          width: 50,
          shape: RoundRectShape(
            borderRadius: BorderRadius.circular(13),
            borderColor: Colors.black, //optional
            borderWidth: 0, //optional
          ),
          child: Container(
            color: kfeedback_bg1,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SvgPicture.asset('assets/icons/order/feedback1.svg',
                  color: Colors.white, semanticsLabel: ''),
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          size: 14,
        ),
        onTap: () {
          Get.toNamed(RECIPIENTS_DETAILS_SCREEN);
        },
      ),
      Divider(
        color: kDividerLine,
        height: 5,
      ),
      ListTile(
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        title: Text(
          "Average",
          style:
          TextStyle(fontSize: kDefaultFontSizeTitle, color: kTextColor),
        ),
        leading: ShapeOfView(
          height: 50,
          width: 50,
          shape: RoundRectShape(
            borderRadius: BorderRadius.circular(13),
            borderColor: Colors.black, //optional
            borderWidth: 0, //optional
          ),
          child: Container(
            color: kfeedback_bg2,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SvgPicture.asset('assets/icons/order/feedback2.svg',
                  color: Colors.white, semanticsLabel: ''),
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          size: 14,
        ),
        onTap: () {
          Get.toNamed(MY_VOUCHER_SCREEN);
        },
      ),
      Divider(
        color: kDividerLine,
        height: 5,
      ),
      ListTile(
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        title: Text(
          "Not Satisfied",
          style:
          TextStyle(fontSize: kDefaultFontSizeTitle, color: kTextColor),
        ),
        leading: ShapeOfView(
          height: 50,
          width: 50,
          shape: RoundRectShape(
            borderRadius: BorderRadius.circular(13),
            borderColor: Colors.black, //optional
            borderWidth: 0, //optional
          ),
          child: Container(
            color: kfeedback_bg3,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SvgPicture.asset('assets/icons/order/feedback3.svg',
                  color: Colors.white, semanticsLabel: ''),
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          size: 14,
        ),
        onTap: () {
          Get.toNamed(FOLLOWED_SHOP_SCREEN);
        },
      ),
      Divider(
        color: kDividerLine,
        height: 5,
      ),
      ListTile(
        contentPadding: const EdgeInsets.all(kDefaultPadding),
        title: Text(
          "Disappointing",
          style:
          TextStyle(fontSize: kDefaultFontSizeTitle, color: kTextColor),
        ),
        leading: ShapeOfView(
          height: 50,
          width: 50,
          shape: RoundRectShape(
            borderRadius: BorderRadius.circular(13),
            borderColor: Colors.black, //optional
            borderWidth: 0, //optional
          ),
          child: Container(
            color: kfeedback_bg4,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SvgPicture.asset('assets/icons/order/feedback4.svg',
                  color: Colors.white, semanticsLabel: ''),
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,
          size: 14,
        ),
        onTap: () {
          Get.toNamed(CHANGE_PASSWORD_SCREEN);
        },
      ),
    ],
  );

  return cardView;*/
}
