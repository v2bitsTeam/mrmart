import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'navigation_bar_item.dart';

class CustomTabView extends StatefulWidget {
  final bool reverse;
  final Curve curve;
  final Color activeColor;
  final Color inactiveColor;
  final Color inactiveStripColor;
  final Color indicatorColor;
  final bool enableShadow;
  final ValueChanged<int> onTap;
  final List<TabViewItem> items;
  final double fontSize;

  CustomTabView(
      {Key key,
      this.reverse = false,
      this.curve = Curves.linear,
      @required this.onTap,
      @required this.items,
      this.activeColor,
      this.inactiveColor,
      this.inactiveStripColor,
      this.indicatorColor,
      this.enableShadow = true,
      this.fontSize = 10})
      : assert(items != null),
        assert(items.length >= 2 && items.length <= 5),
        assert(onTap != null),
        assert(enableShadow != null),
        super(key: key);

  @override
  State createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  static const double BAR_HEIGHT = 60;
  static const double INDICATOR_HEIGHT = 2;

  int currentIndex = 0;
  bool get reverse => widget.reverse;

  Curve get curve => widget.curve;

  List<TabViewItem> get items => widget.items;

  double width = 0;
  Color activeColor;
  Duration duration = Duration(milliseconds: 270);

  double _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr)
      return lerpDouble(-1.0, 1.0, index / (items.length - 1));
    else
      return lerpDouble(1.0, -1.0, index / (items.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    activeColor = widget.activeColor ?? Theme.of(context).indicatorColor;

    return Container(
      height: BAR_HEIGHT + MediaQuery.of(context).viewPadding.bottom,
      width: width,
      decoration: BoxDecoration(
        color: widget.inactiveStripColor ?? Theme.of(context).cardColor,
        boxShadow: widget.enableShadow
            ? [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ]
            : null,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            bottom: INDICATOR_HEIGHT,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items
                  .asMap()
                  .map((index, item) => MapEntry(
                      index,
                      GestureDetector(
                        onTap: () => _select(index),
                        child: _buildItemWidget(item, index == currentIndex),
                      )))
                  .values
                  .toList(),
            ),
          ),
          Positioned(
            bottom: 0,
            width: width,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.withAlpha(150),
                  ),
                ),
                AnimatedAlign(
                  alignment: Alignment(_getIndicatorPosition(currentIndex), 0),
                  curve: curve,
                  duration: duration,
                  child: Container(
                    color: widget.indicatorColor ?? activeColor,
                    width: width / items.length,
                    height: INDICATOR_HEIGHT,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _select(int index) {
    currentIndex = index;
    widget.onTap(currentIndex);

    setState(() {});
  }

  Widget _buildIcon(TabViewItem item, {bool isSelected = false}) {
    return SvgPicture.asset(
      item.icon,
      color: isSelected == false ? widget.inactiveColor : widget.activeColor,
      height: 24,
      width: 24,
    );
  }

  Widget _buildText(TabViewItem item, {bool isSelected = false}) {
    return DefaultTextStyle.merge(
      child: item.title,
      style: TextStyle(
        color: isSelected == false ? widget.inactiveColor : widget.activeColor,
        fontSize: widget.fontSize,
        fontWeight: isSelected == true ? FontWeight.bold : FontWeight.normal,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildItemWidget(TabViewItem item, bool isSelected) {
    return Container(
      color: item.backgroundColor,
      height: BAR_HEIGHT,
      width: width / items.length,
      alignment: Alignment.center,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            item.icon != null
                ? _buildIcon(item, isSelected: isSelected)
                : Container(),
            Padding(
              padding: EdgeInsets.only(top: 2),
              child: _buildText(item, isSelected: isSelected),
            ),
          ],
        ),
      ),
    );
  }
}
