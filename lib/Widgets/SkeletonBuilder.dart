import 'package:mr_mart/Packege/Skeleton/Skeleton.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:flutter/material.dart';

Widget skeletonBuilder({Widget child}) {
  return Skeleton.fromColors(
    baseColor: Themes.grey.withAlpha(30),
    highlightColor: Themes.white.withAlpha(50),
    child: child,
  );
}

Widget orderSkeletonBuilder({Widget child, bool enable = true, Color color}) {
  return Skeleton.fromColors(
    baseColor: color ?? Themes.grey,
    highlightColor: Themes.primary,
    child: child,
    enabled: enable,
  );
}
