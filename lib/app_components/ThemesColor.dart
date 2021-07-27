import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/Dimension.dart';

class Themes {
  static Color primary = Color(0xFF3F51B5);
  static Color primary2 = Color(0xFFFB8C00);
  static Color primary3 = Color(0xFFEF6C00);
  static Color primaryLite = Color(0xFFFFF3E0);
  static Color primaryDark = Color(
    int.parse('#EF6C00'.substring(1, 7), radix: 16) + 0xFF000000,
  );
  static Color primaryAccent = Color(
    int.parse('#FF9100'.substring(1, 7), radix: 16) + 0xFF000000,
  );
  static Color background = Color(0xFFEEF1F7);

// Checkout Page colors
  static Color bG1 = Color(0xFF47B9F3);
  static Color bG2 = Color(0xFF9E60F2);
  static Color bG3 = Color(0xFF89CD54);
  static Color bG4 = Color(0xFFFF7D4F);
  static Color bG5 = Color(0xFF47B9F3);
  static Color bG6 = Color(0xFF2D19C1);
  static Color bG7 = Color(0xFF89CD54);
  static Color bGExpansionChange = Color(0xFFEEF1F7);
  static Color formFieldBorder = Color(0xFFEEF1F7);
  static Color formFieldUpperText = Color(0xFF878787);
// notification page
  static Color clearEdit = Color(0xFFFF3B30);

  static Color iconColor = Color(0xFF263238);
  static Color highlightTextColor = Color(
    int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000,
  );
  static Color textColor = Color(0xFF434343);
  static Color subText = Color(0xFF878787);
  static Color textFieldErrorColor = Color(
    int.parse('#FCDDDD'.substring(1, 7), radix: 16) + 0xFF000000,
  );

  static Color buttonColor1 = Color(
    int.parse('#FC8E22'.substring(1, 7), radix: 16) + 0xFF000000,
  );
  static Color buttonColor2 = Color(
    int.parse('#FDA526'.substring(1, 7), radix: 16) + 0xFF000000,
  );

  static Color dropDown = Color(
    int.parse('#EAECEF'.substring(1, 7), radix: 16) + 0xFF000000,
  );
  static Color curveColor = Color(
    int.parse('#FFFFFF'.substring(1, 7), radix: 16) + 0xFF000000,
  );

  static Color white = Colors.white;
  static Color grey = Colors.grey;
  static Color greyLite = Color(0xFFE0E0E0);
  static Color ratingColor = Color(0xFFFFD54F);

  static Color green = Color(0xFF6FB900);
  static Color greenLite = Color(0xFFA6CC2B);
  static Color yellow = Color(0xFFFFF700);
  static Color red = Color(0xFFC1272D);

  static Color textFieldBorder = Color(0xFF434343);
  static Color textFieldBorderProfile = Color(0xFFEEF1F7);
  static Color border = Color(0xFF707070);

  static Color blue = Color(0xff1473E6);

  static Color cardBackBlueLite = Color(0xFFEEF1F7);

  static var defaultShadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.15),
      blurRadius: Dimension.size5,
      offset: Offset(0, Dimension.size10), // changes position of shadow
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
