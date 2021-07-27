import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

import 'DynamicSIzeWidget.dart';

class ScreenTitle extends StatefulWidget {
  final String title;
  final double minusMargin;
  ScreenTitle(this.title, {this.minusMargin = 0});

  @override
  _ScreenTitleState createState() => _ScreenTitleState();
}

class _ScreenTitleState extends State<ScreenTitle> {
  double titleWidth = Dimension.size100;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimension.size30 - widget.minusMargin,
        top: Dimension.size10,
        bottom: Dimension.padding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DynamicSizeWidget(
            onGetSize: (height, width) {
              titleWidth = width;
              setState(() {});
            },
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: Dimension.size5),
            height: Dimension.size5,
            width: titleWidth * 0.75,
            decoration: BoxDecoration(
              color: Themes.primary,
              borderRadius: BorderRadius.circular(Dimension.size5),
            ),
          ),
        ],
      ),
    );
  }
}
