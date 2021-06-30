import 'package:flutter/material.dart';
import 'package:MrMart/Route/RouteTransition.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/AppConstant.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

AppTheme() {
  return ThemeData(
/*    primaryColor: Themes.Primary_Lite,
    accentColor: Colors.white.withAlpha(1),
    primaryColorDark: Themes.Primary,
    primaryColorLight: Themes.Primary_Lite,*/
    backgroundColor: Themes.Background,
    scaffoldBackgroundColor: Themes.Background,
    fontFamily: AppConstant.font_mukta,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.iOS: RouteTransition(),
      TargetPlatform.android: RouteTransition()
    }),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    //inputDecorationTheme: inputDecorationTheme(),
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(
        color: Themes.Text_Color,
        fontSize: Dimension.Text_Size_Big,
        fontWeight: FontWeight.w700),
    headline2: TextStyle(
        color: Themes.Text_Color,
        fontSize: Dimension.Text_Size_Big,
        fontWeight: FontWeight.bold),
    bodyText1: TextStyle(
        color: Themes.Text_Color,
        fontSize: Dimension.Text_Size,
        fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: Themes.Text_Color,
        fontSize: Dimension.Text_Size_Small,
        fontWeight: FontWeight.normal),
    headline5: TextStyle(
        color: Themes.SUB_TEXT,
        fontSize: Dimension.Text_Size,
        fontWeight: FontWeight.normal),
    headline6: TextStyle(
        color: Themes.Text_Color,
        fontSize: Dimension.Text_Size_Small_Extra,
        fontWeight: FontWeight.normal),
    headline4: TextStyle(
        color: Themes.Primary,
        fontSize: Dimension.Text_Size_Small,
        fontWeight: FontWeight.normal),
    subtitle1: TextStyle(
        color: Themes.SUB_TEXT,
        fontSize: Dimension.Text_Size,
        fontWeight: FontWeight.normal),
    subtitle2: TextStyle(
        color: Themes.Primary,
        fontSize: Dimension.Text_Size_Small_Extra,
        fontWeight: FontWeight.normal),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Themes.Background,
    elevation: 0,
    centerTitle: true,
    //brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.white),
  );
}

/*
InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    //borderRadius: BorderRadius.circular(28),
    //borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    //border: outlineInputBorder,
    border: InputBorder.none,
  );
}*/
