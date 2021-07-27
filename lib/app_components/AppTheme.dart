import 'package:flutter/material.dart';
import 'package:mr_mart/Route/RouteTransition.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

ThemeData appTheme() {
  return ThemeData(
    backgroundColor: Themes.background,
    scaffoldBackgroundColor: Themes.background,
    fontFamily: AppConstant.fontMukta,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: RouteTransition(),
        TargetPlatform.android: RouteTransition()
      },
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(
      color: Themes.textColor,
      fontSize: Dimension.textSizeBig,
      fontWeight: FontWeight.w700,
    ),
    headline2: TextStyle(
      color: Themes.textColor,
      fontSize: Dimension.textSizeBig,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: TextStyle(
      color: Themes.textColor,
      fontSize: Dimension.textSize,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: TextStyle(
      color: Themes.textColor,
      fontSize: Dimension.textSizeSmall,
      fontWeight: FontWeight.normal,
    ),
    headline5: TextStyle(
      color: Themes.subText,
      fontSize: Dimension.textSize,
      fontWeight: FontWeight.normal,
    ),
    headline6: TextStyle(
      color: Themes.textColor,
      fontSize: Dimension.textSizeSmallExtra,
      fontWeight: FontWeight.normal,
    ),
    headline4: TextStyle(
      color: Themes.primary,
      fontSize: Dimension.textSizeSmall,
      fontWeight: FontWeight.normal,
    ),
    subtitle1: TextStyle(
      color: Themes.subText,
      fontSize: Dimension.textSize,
      fontWeight: FontWeight.normal,
    ),
    subtitle2: TextStyle(
      color: Themes.primary,
      fontSize: Dimension.textSizeSmallExtra,
      fontWeight: FontWeight.normal,
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Themes.background,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.white),
  );
}
