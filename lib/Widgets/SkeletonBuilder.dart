import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/Packege/Skeleton/Skeleton.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget SkeletonBuilder({Widget child}) {
  return Skeleton.fromColors(
    baseColor: Themes.Grey.withAlpha(30),
    highlightColor: Themes.White.withAlpha(50),
    child: child,
  );
}

Widget OrderSkeletonBuilder({Widget child, bool enable = true, Color color}) {
  return Skeleton.fromColors(
    baseColor: color ?? Themes.Grey,
    highlightColor: Themes.Primary,
    child: child,
    enabled: enable,
  );
}
