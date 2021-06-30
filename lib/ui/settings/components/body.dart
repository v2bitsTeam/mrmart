import 'package:custom_switch/custom_switch.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MrMart/Route/Route.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/app_components/AppConstant.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xlive_switch/xlive_switch.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool status = false;
  bool _value = true;
  String dropdownLanguageValue = 'English';
  String dropdownCurrencyValue = 'INR';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(bottom: kDefaultPadding),
              title: Text(
                "Notifications",
                style: TextStyle(fontSize: kDefaultFontSize, color: kTextColor),
              ),
              leading: ShapeOfView(
                height: 50,
                width: 50,
                elevation: 0,
                shape: RoundRectShape(
                  borderRadius: BorderRadius.circular(5),
                  borderColor: Colors.black, //optional
                  borderWidth: 0, //optional
                ),
                child: Container(
                  color: kSettings_icon_BG1,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SvgPicture.asset('assets/icons/notification2.svg',
                        color: kSettings_icon1, semanticsLabel: ''),
                  ),
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomSwitch(
                    activeColor: CupertinoColors.activeGreen,
                    value: status,
                    onChanged: (value) {
                      print("VALUE : $value");
                      setState(() {
                        status = value;
                      });
                    },
                  ),
                ],
              ),
              onTap: () {},
            ),
            Divider(
              color: kDividerLine2,
              thickness: 1,
              height: 5,
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: kDefaultPadding),
              title: Text(
                "Push Notifications",
                style: TextStyle(fontSize: kDefaultFontSize, color: kTextColor),
              ),
              leading: ShapeOfView(
                height: 50,
                width: 50,
                elevation: 0,
                shape: RoundRectShape(
                  borderRadius: BorderRadius.circular(5),
                  borderColor: Colors.black, //optional
                  borderWidth: 0, //optional
                ),
                child: Container(
                  color: kSettings_icon_BG2,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SvgPicture.asset('assets/icons/notification2.svg',
                        color: kSettings_icon2, semanticsLabel: ''),
                  ),
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomSwitch(
                    activeColor: CupertinoColors.activeGreen,
                    value: status,
                    onChanged: (value) {
                      print("VALUE : $value");
                      setState(() {
                        status = value;
                      });
                    },
                  ),
                ],
              ),
              onTap: () {},
            ),
            Divider(
              color: kDividerLine2,
              thickness: 1,
              height: 5,
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: kDefaultPadding),
              title: Text(
                "Language",
                style: TextStyle(fontSize: kDefaultFontSize, color: kTextColor),
              ),
              leading: ShapeOfView(
                height: 50,
                width: 50,
                elevation: 0,
                shape: RoundRectShape(
                  borderRadius: BorderRadius.circular(5),
                  borderColor: Colors.black, //optional
                  borderWidth: 0, //optional
                ),
                child: Container(
                  color: kSettings_icon_BG2,
                  child: ShapeOfView(
                    height: 50,
                    width: 50,
                    shape: RoundRectShape(
                      borderRadius: BorderRadius.circular(5),
                      borderColor: Colors.black, //optional
                      borderWidth: 0, //optional
                    ),
                    child: Container(
                      color: kSettings_icon_BG3,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SvgPicture.asset('assets/icons/language.svg',
                            color: kSettings_icon3, semanticsLabel: ''),
                      ),
                    ),
                  ),
                ),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  color: kItemBackgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(5),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  color: Colors.white,
                  dashPattern: [2, 3],
                  strokeWidth: 1,
                  child: DropdownButton<String>(
                    value: dropdownLanguageValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: kBlueTextColor),
                    underline: Container(
                      height: 0,
                      color: Colors.transparent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownLanguageValue = newValue;
                      });
                    },
                    items: <String>['English', 'Bengali', 'Arabic']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              onTap: () {},
            ),
            Divider(
              color: kDividerLine2,
              thickness: 1,
              height: 5,
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: kDefaultPadding),
              title: Text(
                "Currency",
                style: TextStyle(fontSize: kDefaultFontSize, color: kTextColor),
              ),
              leading: ShapeOfView(
                height: 50,
                width: 50,
                elevation: 0,
                shape: RoundRectShape(
                  borderRadius: BorderRadius.circular(5),
                  borderColor: Colors.black, //optional
                  borderWidth: 0, //optional
                ),
                child: Container(
                  color: kSettings_icon_BG4,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SvgPicture.asset('assets/icons/currency.svg',
                        color: kSettings_icon4, semanticsLabel: ''),
                  ),
                ),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  color: kItemBackgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(5),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  color: Colors.white,
                  dashPattern: [2, 3],
                  strokeWidth: 1,
                  child: DropdownButton<String>(
                    value: dropdownCurrencyValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: kBlueTextColor),
                    underline: Container(
                      height: 0,
                      color: Colors.transparent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownCurrencyValue = newValue;
                      });
                    },
                    items: <String>['INR', 'USD', 'RS']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _changeValue(bool value) {
    setState(() {
      _value = value;
    });
  }
}
