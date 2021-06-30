import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

Widget DividerListItem(
    {@required Widget child, Color dividerColor, double dividerHeight = 0.5}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      child,
      Container(
        height: dividerHeight,
        color: dividerColor != null ? dividerColor : Colors.grey,
      )
    ],
  );
}
