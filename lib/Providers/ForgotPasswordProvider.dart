import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/app_components/AppConstant.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool loading = true;
  String countryCode = AppConstant.defaultPhoneCode;

  PageController controller = PageController(initialPage: 0);
  int pageIndex = 0;
  TextEditingController mobile = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController newConPass = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  void setCountryCode(Country country) {
    countryCode = '+${country.phoneCode}';
    notifyListeners();
  }

  back() {
    if (controller.page > 0) {
      controller.animateToPage(controller.page.toInt() - 1,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      pageIndex--;
    } else
      Get.back();
    notifyListeners();
  }

  onPageChange(int index) {
    pageIndex = index;
    notifyListeners();
  }

  void changePage() {
    if (pageIndex < 2) {
      controller.animateToPage(controller.page.toInt() + 1,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      notifyListeners();
    } else {
      Get.toNamed(AUTHENTICATION);
    }
  }
}
