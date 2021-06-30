import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/main.dart';

class OnBoardingProvider with ChangeNotifier {
  bool Loading = true;

  PageController controller;
  int currentIndex = 0;

  List<Color> itemColor = [
    Color(0xFF8EECBC),
    Color(0xFFBFE8FD),
    Color(0xFFFFD5E0),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  OnBoardingProvider() {
    controller = PageController(
      initialPage: 0,
    );
  }

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  /* Future getData() async {
    Loading = true;
    notifyListeners();
    await Api_Client.Request(context,
        url: URL.Get_Restaurant, onSuccess: (data) {}, onError: (data) {});
    Loading = false;
    notifyListeners();
  }*/
}
