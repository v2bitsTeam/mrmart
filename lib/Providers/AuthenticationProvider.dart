import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_mart/app_components/AppConstant.dart';

class AuthenticationProvider with ChangeNotifier {
  bool loading = true;
  bool userSignedUp = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conPassword = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  String countryCode = AppConstant.defaultPhoneCode;

  String error;

  List<String> socialIcons = [
    'assets/icons/facebook.svg',
    'assets/icons/gmail.svg',
    'assets/icons/twitter.svg'
  ];

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
    if (controller.page == 0)
      controller.animateToPage(1,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    else
      controller.animateToPage(0,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);

    notifyListeners();
  }
}
