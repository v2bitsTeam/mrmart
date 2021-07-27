import 'package:flutter/material.dart';

class TabViewItem {
  final Widget title;
  final String icon;
  final Color backgroundColor;

  TabViewItem({
    @required this.icon,
    @required this.title,
    this.backgroundColor = Colors.white,
  });
}
