import 'dart:async';
import 'package:mr_mart/Controllers/pincodes_controller.dart';
import 'package:mr_mart/Controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:mr_mart/Widgets/DefaultAppbar.dart';
import '../../main.dart';
import 'package:mr_mart/app_components/size_configue.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final UserController userController = Get.put(UserController());
  final PincodesController pincodesController = Get.put(PincodesController());

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(seconds: 2),
        lowerBound: 0.85,
        upperBound: 1,
        vsync: this)
      ..repeat(reverse: true);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInCubic);
    startTime();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));

    userController.getUserFromCache();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    paddingTop = MediaQuery.of(context).padding.top;
    paddingBottom = MediaQuery.of(context).padding.bottom;
    appbarHeight =
        defaultAppbar(context: context, title: 'Demo').preferredSize.height;
    return Scaffold(
      backgroundColor: Themes.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            alignment: Alignment.center,
            scale: _animation,
            child: Image.asset(
              'assets/images/logo.png',
              color: Themes.primary2,
              width: Get.height * 0.2,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Text(
              AppConstant.appName,
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: Dimension.size36,
                    color: Themes.primary2,
                  ),
            ),
          ),
          Container(
            width: Get.width * 0.5,
            child: LinearProgressIndicator(
              backgroundColor: Themes.primary2,
            ),
          )
        ],
      ),
    );
  }
}
