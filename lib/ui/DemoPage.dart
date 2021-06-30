import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/Providers/LocationPermissionProvider.dart';
import 'package:MrMart/Providers/SplashProvider.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/Widgets/DefaultAppbar.dart';

import 'package:provider/provider.dart';

import '../main.dart';
import 'BaseActivity.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> with TickerProviderStateMixin {
  LocationPermissionProvider provider;

  double invisibleHeight = (Get.height * 0.15) * 0.2;

  @override
  void initState() {
    // TODO: implement initState
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
            title: language.Location_Permission,
            body: mainView(),
          );
        },
      ),
    );
  }

  Widget mainView() {
    return Container(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: invisibleHeight,
          )
        ],
      ),
    );
  }
}
