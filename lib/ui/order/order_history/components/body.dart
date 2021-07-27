import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(kDefaultPadding),
            title: Text(
              "Notifications",
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
                color: Themes.bG3,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SvgPicture.asset('assets/icons/notification2.svg',
                      color: Colors.white, semanticsLabel: ''),
                ),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_sharp,
              size: 14,
            ),
            onTap: () => Get.toNamed(RECIPIENTS_DETAILS_SCREEN),
          ),
          Divider(
            color: kDividerLine,
            thickness: 2,
            height: 5,
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(kDefaultPadding),
            title: Text(
              "Push Notifications",
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
                color: Themes.bG3,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SvgPicture.asset('assets/icons/notification.svg',
                      color: Colors.white, semanticsLabel: ''),
                ),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_sharp,
              size: 14,
            ),
            onTap: () => Get.toNamed(MY_VOUCHER_SCREEN),
          ),
          Divider(
            color: kDividerLine,
            height: 5,
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(kDefaultPadding),
            title: Text(
              "Language",
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
                color: Themes.bG3,
                child: Icon(
                  Icons.notifications_outlined,
                  size: 14,
                ),
              ),
            ),
            trailing: ShapeOfView(
              height: 50,
              width: 50,
              shape: RoundRectShape(
                borderRadius: BorderRadius.circular(5),
                borderColor: Colors.black, //optional
                borderWidth: 0, //optional
              ),
              child: Container(
                color: Themes.bG3,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SvgPicture.asset('assets/icons/language.svg',
                      color: Colors.white, semanticsLabel: ''),
                ),
              ),
            ),
            onTap: () => Get.toNamed(FOLLOWED_SHOP_SCREEN),
          ),
          Divider(
            color: kDividerLine,
            height: 5,
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(kDefaultPadding),
            title: Text(
              "Currency",
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
                color: Themes.bG3,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SvgPicture.asset('assets/icons/currency.svg',
                      color: Colors.white, semanticsLabel: ''),
                ),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.purple,
              size: 20,
            ),
            onTap: () => Get.toNamed(CHANGE_PASSWORD_SCREEN),
          ),
        ],
      ),
    );
  }
}
