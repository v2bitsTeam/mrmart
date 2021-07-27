import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchLocationProvider with ChangeNotifier {
  bool loading = true;

  GoogleMapController mapController;
  @override
  void dispose() {
    super.dispose();
  }
}
