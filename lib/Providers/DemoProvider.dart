import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DemoProvider with ChangeNotifier {

  bool Loading = true;

  @override
  void dispose() {
    super.dispose();
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
