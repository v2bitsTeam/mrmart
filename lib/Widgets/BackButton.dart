import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/main.dart';

Widget defaultBackButton(
  BuildContext context, {
  Color color,
  Function onTap,
}) {
  return Positioned(
    left: Dimension.size5,
    top: paddingTop,
    child: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      onPressed: () {
        if (onTap == null)
          Get.back();
        else
          onTap();
      },
    ),
  );
}
