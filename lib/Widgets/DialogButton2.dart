import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/Packege/Loading_Button/Loading_Button.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/main.dart';

Widget DialogButton2(
    {String negativeButton, String positiveButton, Function onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      LoadingButton(
        onPressed: () => onTap(false),
        backgroundColor: Themes.Primary2,
        buttonDecoration: ButtonDecoration.Shadow,
        child: Container(
            alignment: Alignment.center,
            width: Get.width * 0.22,
            child: Text(
              negativeButton,
              style: TextStyle(
                  color: Themes.White,
                  fontSize: Dimension.Text_Size_Big,
                  fontWeight: Dimension.textBold),
            )),
      ),
      Expanded(
        child: SizedBox(
          width: Dimension.Size_10,
        ),
      ),
      LoadingButton(
        onPressed: () => onTap(true),
        backgroundColor: Themes.Primary,
        buttonDecoration: ButtonDecoration.Shadow,
        child: Container(
            width: Get.width * 0.35,
            alignment: Alignment.center,
            child: Text(
              positiveButton,
              style: TextStyle(
                  color: Themes.White,
                  fontSize: Dimension.Text_Size_Big,
                  fontWeight: Dimension.textBold),
            )),
      ),
    ],
  );
}
