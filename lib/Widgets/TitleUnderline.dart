import 'package:flutter/cupertino.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

Widget TitleUnderline({@required width, Color color, double height}) {
  return Container(
    margin: EdgeInsets.only(top: Dimension.Size_2, bottom: Dimension.Size_2),
    height: height ?? Dimension.Size_5,
    width: width,
    decoration: BoxDecoration(
        color: color ?? Themes.Primary,
        borderRadius: BorderRadius.circular(Dimension.Size_5)),
  );
}
