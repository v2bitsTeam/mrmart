import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

Widget dividerList({Widget child, bool showDivider = true, Color color}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      child,
      Visibility(
          visible: showDivider,
          child: Divider(
            height: 1,
            thickness: 1,
            color: color ?? Themes.grey.withAlpha(70),
          ))
    ],
  );
}
