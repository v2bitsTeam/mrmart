import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/AppConstant.dart';

TextStyle headingStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
);

TextStyle tabHeadingStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
);

TextStyle contentStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  fontFamily: AppConstant.fontMukta,
);

LinearGradient gradientStyle = LinearGradient(
  colors: [Color(0xfff3953b), Color(0xffe57509)],
  stops: [0, 1],
  begin: Alignment.topCenter,
);
