import 'package:MrMart/Controllers/cart_controller.dart';
import 'package:MrMart/Route/Route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'dart:async';
import 'dart:io';
import '../main.dart';

class BaseActivity extends StatefulWidget {
  String title;
  bool returnData = false;
  Widget action;
  Color color;
  Widget body;
  Widget bottomNavigationBar;
  Widget leading;
  bool automaticLeading;

  BaseActivity(
      {@required this.title,
      @required this.body,
      this.returnData,
      this.action,
      this.color,
      this.bottomNavigationBar,
      this.leading,
      this.automaticLeading = true});

  @override
  _BaseActivityState createState() => _BaseActivityState();
}

class _BaseActivityState extends State<BaseActivity> {
  double invisibleHeight = (Get.height * 0.15) * 0.2;
  final CartController cartController = Get.find();

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => exit(0),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.white,
                width: Get.width,
                height: Get.height,
                padding: EdgeInsets.only(
                    top: paddingTop + ((Get.height * 0.2) * 0.2)),
                child: widget.body,
              ),
            ),
            Positioned(
              top: 0,
              width: Get.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/header.png',
                    alignment: Alignment.center,
                    height: Get.height * 0.15,
                    width: Get.width,
                    fit: BoxFit.fill,
                    color: Themes.Primary2,
                  ),
                  Positioned(
                    top: invisibleHeight,
                    width: Get.width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: Dimension.Size_5,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 50.0),
                          child: Opacity(
                            opacity: widget.automaticLeading ? 1 : 0,
                            child: widget.leading ??
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                  onPressed: widget.automaticLeading
                                      ? () {
                                          Get.back(result: widget.returnData);
                                        }
                                      : null,
                                ),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          widget.title,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              color: Themes.White,
                              fontSize: Dimension.Size_20,
                              fontWeight: Dimension.textMedium),
                          textAlign: TextAlign.center,
                        )),
                        widget.action != null
                            ? widget.action
                            : Padding(
                                padding: EdgeInsets.only(right: 24.0),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 35,
                                        height: 35,
                                        margin: EdgeInsets.only(right: 20.0),
                                        child: IconButton(
                                          iconSize: 30.0,
                                          icon: Icon(
                                            Icons.pin_drop_outlined,
                                            color: Colors.white,
                                          ),
                                          onPressed: () => Get.toNamed(
                                              GET_USER_LOCATION_SCREEN,
                                              arguments: true),
                                        )),
                                    Container(
                                      width: 35,
                                      height: 35,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: 2,
                                            left: 0,
                                            child: InkWell(
                                              child: SvgPicture.asset(
                                                  'assets/icons/cart_white.svg'),
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CartScreen()),
                                                );
                                              },
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: Container(
                                              width: 20.0,
                                              height: 20.0,
                                              alignment: Alignment.topCenter,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Obx(
                                                () => Text(
                                                  cartController.cart.length
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: widget.bottomNavigationBar,
      ),
    );
  }
}
