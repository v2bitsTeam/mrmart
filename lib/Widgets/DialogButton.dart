import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

Widget DialogButton(
    {String negativeButton, String positiveButton, Function onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      FlatButton(
        child: Text(
          negativeButton,
          style: TextStyle(
              color: Themes.Primary,
              fontSize: Dimension.Text_Size_Small,
              fontWeight: Dimension.textBold),
        ),
        onPressed: () => onTap(false),
      ),
      FlatButton(
        child: Text(
          positiveButton,
          style: TextStyle(
              color: Themes.Green,
              fontSize: Dimension.Text_Size_Small,
              fontWeight: Dimension.textBold),
        ),
        onPressed: () => onTap(true),
      ),
    ],
  );
}
