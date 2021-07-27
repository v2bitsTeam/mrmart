import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/Packege/Loading_Button/Loading_Button.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

Widget dialogButton2(
    {String negativeButton, String positiveButton, Function onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      LoadingButton(
        onPressed: () => onTap(false),
        backgroundColor: Themes.primary2,
        buttonDecoration: ButtonDecoration.Shadow,
        child: Container(
          alignment: Alignment.center,
          width: Get.width * 0.22,
          child: Text(
            negativeButton,
            style: TextStyle(
                color: Themes.white,
                fontSize: Dimension.textSizeBig,
                fontWeight: Dimension.textBold),
          ),
        ),
      ),
      Expanded(
        child: SizedBox(
          width: Dimension.size10,
        ),
      ),
      LoadingButton(
        onPressed: () => onTap(true),
        backgroundColor: Themes.primary,
        buttonDecoration: ButtonDecoration.Shadow,
        child: Container(
          width: Get.width * 0.35,
          alignment: Alignment.center,
          child: Text(
            positiveButton,
            style: TextStyle(
              color: Themes.white,
              fontSize: Dimension.textSizeBig,
              fontWeight: Dimension.textBold,
            ),
          ),
        ),
      ),
    ],
  );
}
