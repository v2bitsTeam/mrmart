import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/main.dart';

Widget DefaultBackButton(BuildContext context, {Color color, Function onTap}) {
  return Positioned(
    left: Dimension.Size_5,
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
