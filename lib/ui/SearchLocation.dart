import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:MrMart/AppHelper/MapUtil.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/Packege/Loading_Button/Loading_Button.dart';
import 'package:MrMart/Providers/SearchLocationProvider.dart';
import 'package:MrMart/Route/Route.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

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
    // TODO: implement initState
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
            title: language.Search_Location,
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
            top: invisibleHeight + Dimension.Size_20,
            child: Container(
              decoration: BoxDecoration(
                color: Themes.Grey_lite,
                borderRadius: BorderRadius.circular(10),
                boxShadow: Themes.defaultShadow2,
              ),
              width: Get.width,
              //height: Get.height * 0.05,
              //padding: EdgeInsets.only(left: Dimension.Size_24, right: Dimension.Size_24,),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /*SizedBox(
                    width: Dimension.Size_10,
                  ),*/
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.search,
                      color: Themes.Icon_Color,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      autocorrect: false,
                      cursorColor: Themes.Primary,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Themes.Grey_lite,
                        border: InputBorder.none,
                        hintText: language.Search_Your_location,
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
            bottom: Dimension.Size_20,
            child: LoadingButton(
              isLoading: false,
              onPressed: () {
                Get.toNamed(TAKE_PHONE_NUMBER);
              },
              child: Container(
                width: Get.width - (Dimension.Padding * 6),
                alignment: Alignment.center,
                padding: EdgeInsets.all(Dimension.Size_20)
                    .copyWith(top: 0, bottom: 0),
                child: Text(
                  language.Continue,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Themes.White, fontSize: Dimension.Size_20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
