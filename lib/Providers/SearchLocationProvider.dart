import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class SearchLocationProvider with ChangeNotifier {

  bool Loading = true;

  GoogleMapController mapController;
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
