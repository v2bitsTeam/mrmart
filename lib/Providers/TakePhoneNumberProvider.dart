import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/app_components/AppConstant.dart';

class TakePhoneNumberProvider with ChangeNotifier {
  String countryCode = AppConstant.defaultPhoneCode;

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

  void back() {
    if (controller.page > 0) {
      controller.animateToPage(controller.page.toInt() - 1,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      pageIndex--;
    } else
      Get.back();
    notifyListeners();
  }

  void onPageChange(int index) {
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
}
