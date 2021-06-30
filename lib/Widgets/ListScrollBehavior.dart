import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ListScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}