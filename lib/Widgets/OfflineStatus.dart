import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/main.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfflineStatus extends StatefulWidget {
  Widget child;

  OfflineStatus({this.child});

  @override
  _OfflineStatusState createState() => _OfflineStatusState();
}

class _OfflineStatusState extends State<OfflineStatus> {
  @override
  Widget build(BuildContext context) {
    return ConnectivityWidgetWrapper(
        disableInteraction: false,
        alignment: Alignment.bottomCenter,
        offlineWidget: Container(
          color: Themes.TextField_Error_Color,
          width: Get.width,
          padding: EdgeInsets.all(5),
          child: Text(
            language.Offline,
            textAlign: TextAlign.center,
          ),
        ),
        child: widget.child);
  }
}
