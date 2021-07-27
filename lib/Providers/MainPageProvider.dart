import 'package:flutter/material.dart';

class MainPageProvider with ChangeNotifier {
  bool loading = true;
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
}
