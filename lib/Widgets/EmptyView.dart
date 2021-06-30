import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget EmptyView({String image = 'assets/images/empty.gif', Widget message}) {
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
                language.No_data_here,
                style: TextStyle(
                    color: Themes.Grey,
                    fontSize: Dimension.Text_Size_Big,
                    fontWeight: FontWeight.bold),
              )
            : message,
      ],
    ),
  );
}
