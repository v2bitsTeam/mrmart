import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget CircularProgress(
    {double size = 20,
    Color color,
    double width = 2,
    Alignment alignment = Alignment.center}) {
  return Align(
    alignment: alignment,
    child: SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
          strokeWidth: width,
          valueColor: AlwaysStoppedAnimation<Color>(
              color == null ? Themes.Primary : color)),
    ),
  );
}
