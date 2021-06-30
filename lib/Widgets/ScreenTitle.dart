import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

import 'DynamicSIzeWidget.dart';

class ScreenTitle extends StatefulWidget {
  String title;
  double minusMargin;
  ScreenTitle(this.title, {this.minusMargin = 0});

  @override
  _ScreenTitleState createState() => _ScreenTitleState();
}

class _ScreenTitleState extends State<ScreenTitle> {
  double titleWidth = Dimension.Size_100;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimension.Size_30 - widget.minusMargin,
          top: Dimension.Size_10,
          bottom: Dimension.Padding),
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
              )),
          Container(
            margin: EdgeInsets.only(top: Dimension.Size_5),
            height: Dimension.Size_5,
            width: titleWidth * 0.75,
            decoration: BoxDecoration(
                color: Themes.Primary,
                borderRadius: BorderRadius.circular(Dimension.Size_5)),
          ),
        ],
      ),
    );
  }
}
