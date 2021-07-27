import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

Widget imagePlaceHolder({@required double height, bool isError = false}) {
  return Container(
    color: Themes.white,
    child: isError
        ? Image.asset(
            'assets/images/empty.png',
            fit: BoxFit.cover,
            height: height,
          )
        : null,
  );
}
