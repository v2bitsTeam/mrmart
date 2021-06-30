import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar DefaultAppbar(
    {BuildContext context,
    String title,
    bool returnData = false,
    Widget action,
    Color color}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.white),
    ),
    centerTitle: true,
    backgroundColor: color ?? Themes.Primary,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      onPressed: () {
        Get.back(result: returnData);
      },
    ),
    actions: [action == null ? Container() : action],
  );
}
