import 'package:flutter/material.dart';

class OnBoardingProvider with ChangeNotifier {
  bool loading = true;

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
}
