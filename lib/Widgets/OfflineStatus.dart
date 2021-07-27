import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/main.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfflineStatus extends StatefulWidget {
  final Widget child;
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
        color: Themes.textFieldErrorColor,
        width: Get.width,
        padding: EdgeInsets.all(5),
        child: Text(
          language.offline,
          textAlign: TextAlign.center,
        ),
      ),
      child: widget.child,
    );
  }
}
