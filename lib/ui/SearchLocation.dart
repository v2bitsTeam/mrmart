import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mr_mart/AppHelper/MapUtil.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/Packege/Loading_Button/Loading_Button.dart';
import 'package:mr_mart/Providers/SearchLocationProvider.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

import 'package:provider/provider.dart';

import '../main.dart';
import 'BaseActivity.dart';

class SearchLocation extends StatefulWidget {
  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation>
    with TickerProviderStateMixin {
  SearchLocationProvider provider;

  double invisibleHeight = (Get.height * 0.15) * 0.2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchLocationProvider>(
      create: (_) => SearchLocationProvider(),
      child: Consumer<SearchLocationProvider>(
        builder: (context, model, child) {
          provider = model;
          return BaseActivity(
            title: language.searchLocation,
            body: mainView(),
          );
        },
      ),
    );
  }

  Widget mainView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
              child: GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(17.328644, 78.575302),
              zoom: 14.4746,
            ),
            onMapCreated: (GoogleMapController controller) {
              provider.mapController = controller;
              provider.mapController.setMapStyle(MapUtil.style);
            },
          )),
          Positioned(
            top: invisibleHeight + Dimension.size20,
            child: Container(
              decoration: BoxDecoration(
                color: Themes.greyLite,
                borderRadius: BorderRadius.circular(10),
                boxShadow: Themes.defaultShadow2,
              ),
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.search,
                      color: Themes.iconColor,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      autocorrect: false,
                      cursorColor: Themes.primary,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Themes.greyLite,
                        border: InputBorder.none,
                        hintText: language.searchYourLocation,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/icons/marker.png',
            height: Get.height * 0.1,
          ),
          Positioned(
            bottom: Dimension.size20,
            child: LoadingButton(
              isLoading: false,
              onPressed: () {
                Get.toNamed(TAKE_PHONE_NUMBER);
              },
              child: Container(
                width: Get.width - (Dimension.padding * 6),
                alignment: Alignment.center,
                padding: EdgeInsets.all(Dimension.size20)
                    .copyWith(top: 0, bottom: 0),
                child: Text(
                  language.continueWord,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Themes.white, fontSize: Dimension.size20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
