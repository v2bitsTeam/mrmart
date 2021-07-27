import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget emptyView({String image = 'assets/images/empty.gif', Widget message}) {
  return Container(
    width: Get.width,
    height: 300,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          image,
          height: 200,
        ),
        message == null
            ? Text(
                language.noDataHere,
                style: TextStyle(
                    color: Themes.grey,
                    fontSize: Dimension.textSizeBig,
                    fontWeight: FontWeight.bold),
              )
            : message,
      ],
    ),
  );
}
