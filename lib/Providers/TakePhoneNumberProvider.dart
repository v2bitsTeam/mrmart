import 'dart:async';

import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/Route/Route.dart';
import 'package:MrMart/app_components/AppConstant.dart';

class TakePhoneNumberProvider with ChangeNotifier {
  bool Loading = true;
  String countryCode = AppConstant.Default_Phone_Code;

  PageController controller = PageController(initialPage: 0);
  int pageIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  void setCountryCode(Country country) {
    countryCode = '+${country.phoneCode}';
    notifyListeners();
  }

  Future<bool> back() {
    if (controller.page > 0) {
      controller.animateToPage(controller.page.toInt() - 1,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      pageIndex--;
    } else
      Get.back();
    notifyListeners();
  }

  int onPageChange(int index) {
    pageIndex = index;
    notifyListeners();
  }

  void changePage() {
    if (controller.page.toInt() == 0) {
      controller.animateToPage(controller.page.toInt() + 1,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      notifyListeners();
    } else
      Get.toNamed(AUTHENTICATION);
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
