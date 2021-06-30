import 'package:flutter/material.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/ui/LocationPermission.dart';
import 'package:MrMart/ui/SearchLocation.dart';
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
            "Current Location",
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
              color: kOrderTrack_icon1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.asset('assets/icons/location_current.svg',
                    color: Colors.white, semanticsLabel: ''),
              ),
            ),
          ),
          onTap: () {
            Get.toNamed(MAIN_PAGE);
          },
        ),
        Divider(
          color: Colors.black.withOpacity(.1),
          height: 5,
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(kDefaultPadding),
          title: Text(
            "Location 1",
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
              color: kLocation_one_bg1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  'assets/icons/location_one.svg',
                ),
              ),
            ),
          ),
          onTap: () {
            Get.toNamed(MAIN_PAGE);
          },
        ),
        Divider(
          color: Colors.black.withOpacity(.1),
          height: 5,
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(kDefaultPadding),
          title: Text(
            "Location 2",
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
              color: kLocation_one_bg2,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  'assets/icons/location_two.svg',
                ),
              ),
            ),
          ),
          onTap: () {
            Get.toNamed(MAIN_PAGE);
          },
        ),
        Divider(
          color: Colors.black.withOpacity(.1),
          height: 5,
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(kDefaultPadding),
          title: Text(
            "Add New Location",
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
                child: SvgPicture.asset('assets/icons/add.svg',
                    color: Colors.white, semanticsLabel: ''),
              ),
            ),
          ),
          onTap: () {
            Get.toNamed(MAIN_PAGE);
            //Get.toNamed(SEARCH_LOCATION);
          },
        ),
      ],
    ),
  );

  return cardView;
}
