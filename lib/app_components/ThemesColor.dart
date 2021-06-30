import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

class Themes {
  // static Color Primary = Color(0xff1473E6);
  static Color Primary = Color(0xFF3F51B5);
  static Color Primary2 = Color(0xFFFB8C00);
  static Color Primary3 = Color(0xFFEF6C00);
  static Color Primary_Lite = Color(0xFFFFF3E0);
  static Color Primary_Dark =
      Color(int.parse('#EF6C00'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Primary_Accent =
      Color(int.parse('#FF9100'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Background = Color(0xFFEEF1F7);

// Checkout Page colors
  static Color BG1 = Color(0xFF47B9F3);
  static Color BG2 = Color(0xFF9E60F2);
  static Color BG3 = Color(0xFF89CD54);
  static Color BG4 = Color(0xFFFF7D4F);
  static Color BG5 = Color(0xFF47B9F3);
  static Color BG6 = Color(0xFF2D19C1);
  static Color BG7 = Color(0xFF89CD54);
  static Color BG_expantion_change = Color(0xFFEEF1F7);
  static Color Form_field_border = Color(0xFFEEF1F7);
  static Color Form_field_upper_Text = Color(0xFF878787);
// notification page
  static Color Clear_Edit = Color(0xFFFF3B30);

  static Color Icon_Color = Color(0xFF263238);
  static Color Highlite_Text_Color =
      Color(int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Text_Color = Color(0xFF434343);
  static Color SUB_TEXT = Color(0xFF878787);
  static Color TextField_Error_Color =
      Color(int.parse('#FCDDDD'.substring(1, 7), radix: 16) + 0xFF000000);

  static Color Button_Color1 =
      Color(int.parse('#FC8E22'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Button_Color2 =
      Color(int.parse('#FDA526'.substring(1, 7), radix: 16) + 0xFF000000);

  static Color DropDown =
      Color(int.parse('#EAECEF'.substring(1, 7), radix: 16) + 0xFF000000);
  static Color Curve_Color =
      Color(int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000);

  static Color White = Colors.white;
  static Color Grey = Colors.grey;
  static Color Grey_lite = Color(0xFFE0E0E0);
  static Color Rating_Color = Color(0xFFFFD54F);

  static Color Green = Color(0xFF6FB900);
  static Color Green_lite = Color(0xFFA6CC2B);
  static Color Yellow = Color(0xFFFFF700);
  static Color Red = Color(0xFFC1272D);

  static Color TexftFieldBorder = Color(0xFF434343);
  static Color TexftFieldBorderProfile = Color(0xFFEEF1F7);
  static Color Border = Color(0xFF707070);

  static Color Blue = Color(0xff1473E6);

  static Color Card_Back_Blue_Lite = Color(0xFFEEF1F7);

  static var defaultShadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.15),
      blurRadius: Dimension.Size_5,
      offset: Offset(0, Dimension.Size_10), // changes position of shadow
    ),
  ];
  static var defaultShadow2 = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.15),
      blurRadius: 1,
      offset: Offset(0, 1), // changes position of shadow
    ),
  ];

  static Color getColorFromColorCode(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static randomColor() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
