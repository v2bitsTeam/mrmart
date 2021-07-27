import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_mart/Providers/LocationPermissionProvider.dart';
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
