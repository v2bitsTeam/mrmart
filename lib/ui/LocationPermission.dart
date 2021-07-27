import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/Packege/Loading_Button/Loading_Button.dart';
import 'package:mr_mart/Providers/LocationPermissionProvider.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'BaseActivity.dart';

class LocationPermission extends StatefulWidget {
  @override
  _LocationPermissionState createState() => _LocationPermissionState();
}

class _LocationPermissionState extends State<LocationPermission>
    with TickerProviderStateMixin {
  LocationPermissionProvider provider;

  double invisibleHeight = (Get.height * 0.15) * 0.2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocationPermissionProvider>(
      create: (_) => LocationPermissionProvider(),
      child: Consumer<LocationPermissionProvider>(
        builder: (context, model, child) {
          provider = model;
          return BaseActivity(
            title: language.locationPermission,
            body: mainView(),
          );
        },
      ),
    );
  }

  Widget mainView() {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/location-permission.svg',
                  height: Get.height * 0.2,
                ),
                Padding(
                  padding: EdgeInsets.all(Dimension.size30),
                  child: Text(
                    language.locationPermissionMessage,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: Dimension.size20,
            child: LoadingButton(
              isLoading: false,
              onPressed: () {
                Get.toNamed(SEARCH_LOCATION);
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
                  )),
            ),
          )
        ],
      ),
    );
  }
}
