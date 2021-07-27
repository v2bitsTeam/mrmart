import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

Widget dialogButton(
    {String negativeButton, String positiveButton, Function onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TextButton(
        child: Text(
          negativeButton,
          style: TextStyle(
            color: Themes.primary,
            fontSize: Dimension.textSizeSmall,
            fontWeight: Dimension.textBold,
          ),
        ),
        onPressed: () => onTap(false),
      ),
      TextButton(
        child: Text(
          positiveButton,
          style: TextStyle(
            color: Themes.green,
            fontSize: Dimension.textSizeSmall,
            fontWeight: Dimension.textBold,
          ),
        ),
        onPressed: () => onTap(true),
      ),
    ],
  );
}
