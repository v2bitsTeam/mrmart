import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageProvider with ChangeNotifier {
  bool Loading = true;
  int selectedTab = 0;

  TabController tabController;

  @override
  void dispose() {
    super.dispose();
  }

  void setController(mainPage) {
    tabController =
        TabController(length: 3, vsync: mainPage, initialIndex: selectedTab);
  }

  void handleIndexChanged(int i) {
    selectedTab = i;
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
