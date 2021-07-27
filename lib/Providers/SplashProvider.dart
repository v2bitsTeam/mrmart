import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class SplashProvider with ChangeNotifier {
  SplashProvider() {
    SharedPreferences.getInstance().then(
      (pr) {
        prefs = pr;
        startTime();
      },
    );
  }

  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
    Get.toNamed(ROOT_PAGE);
  }
}
