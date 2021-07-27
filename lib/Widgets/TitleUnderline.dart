import 'package:flutter/cupertino.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

Widget titleUnderline({@required width, Color color, double height}) {
  return Container(
    margin: EdgeInsets.only(
      top: Dimension.size2,
      bottom: Dimension.size2,
    ),
    height: height ?? Dimension.size5,
    width: width,
    decoration: BoxDecoration(
      color: color ?? Themes.primary,
      borderRadius: BorderRadius.circular(Dimension.size5),
    ),
  );
}
