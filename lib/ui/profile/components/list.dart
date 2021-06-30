import 'package:flutter/material.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:get/get.dart';
import 'package:MrMart/Route/Route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget getListView() {
  var cardView = Card(
    child: ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(kDefaultPadding),
          title: Text(
            "Recipients Details",
            style:
                TextStyle(fontSize: kDefaultFontSizeTitle, color: kTextColor),
          ),
          leading: ShapeOfView(
            height: 50,
            width: 50,
            shape: RoundRectShape(
              borderRadius: BorderRadius.circular(5),
              borderColor: Colors.black, //optional
              borderWidth: 0, //optional
            ),
            child: Container(
              color: Themes.BG1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.asset('assets/icons/checkout/person.svg',
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
        // ListTile(
        //   contentPadding: const EdgeInsets.all(kDefaultPadding),
        //   title: Text(
        //     "My Wishlist",
        //     style:
        //         TextStyle(fontSize: kDefaultFontSizeTitle, color: kTextColor),
        //   ),
        //   leading: ShapeOfView(
        //     height: 50,
        //     width: 50,
        //     shape: RoundRectShape(
        //       borderRadius: BorderRadius.circular(5),
        //       borderColor: Colors.black, //optional
        //       borderWidth: 0, //optional
        //     ),
        //     child: Container(
        //       color: Themes.BG2,
        //       child: Padding(
        //         padding: EdgeInsets.all(10.0),
        //         child: SvgPicture.asset('assets/icons/voucher/voucher.svg',
        //             color: Colors.white, semanticsLabel: ''),
        //       ),
        //     ),
        //   ),
        //   trailing: Icon(
        //     Icons.arrow_forward_ios_sharp,
        //     size: 14,
        //   ),
        //   onTap: () {
        //     Get.toNamed(MY_VOUCHER_SCREEN);
        //   },
        // ),
        // Divider(
        //   color: kDividerLine,
        //   height: 5,
        // ),
        ListTile(
          contentPadding: const EdgeInsets.all(kDefaultPadding),
          title: Text(
            "My Orders",
            style:
                TextStyle(fontSize: kDefaultFontSizeTitle, color: kTextColor),
          ),
          leading: ShapeOfView(
            height: 50,
            width: 50,
            shape: RoundRectShape(
              borderRadius: BorderRadius.circular(5),
              borderColor: Colors.black, //optional
              borderWidth: 0, //optional
            ),
            child: Container(
              color: Themes.BG3,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.asset('assets/icons/followed_shop.svg',
                    color: Colors.white, semanticsLabel: ''),
              ),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_sharp,
            size: 14,
          ),
          onTap: () {
            Get.toNamed(ORDER_HISTORY_SCREEN);
          },
        ),
        Divider(
          color: kDividerLine,
          height: 5,
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(kDefaultPadding),
          title: Text(
            "Change Password",
            style:
                TextStyle(fontSize: kDefaultFontSizeTitle, color: kTextColor),
          ),
          leading: ShapeOfView(
            height: 50,
            width: 50,
            shape: RoundRectShape(
              borderRadius: BorderRadius.circular(5),
              borderColor: Colors.black, //optional
              borderWidth: 0, //optional
            ),
            child: Container(
              color: Themes.BG4,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.asset('assets/icons/key.svg',
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
    ),
  );

  return cardView;
}
