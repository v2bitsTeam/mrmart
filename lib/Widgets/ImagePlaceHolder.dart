import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

Widget ImagePlaceHolder({@required double height, bool isError = false}) {
  return Container(
    color: Themes.White,
    child: isError
        ? Image.asset(
            'assets/images/empty.png',
            fit: BoxFit.cover,
            height: height,
          )
        : null,
  );
}
