import 'dart:async';
import 'package:flutter/material.dart';

class DynamicSizeWidget extends StatefulWidget {
  final Widget child;
  final bool isEnableGetSize;
  final Function onGetSize;

  DynamicSizeWidget({this.child, this.isEnableGetSize = true, this.onGetSize});

  @override
  _DynamicSizeWidgetState createState() => _DynamicSizeWidgetState();
}

class _DynamicSizeWidgetState extends State<DynamicSizeWidget> {
  final GlobalKey stickyKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    getHeight();
  }

  getHeight() {
    if (widget.isEnableGetSize) {
      Timer(Duration(milliseconds: 50), () {
        try {
          final keyContext = stickyKey.currentContext;
          final box = keyContext.findRenderObject() as RenderBox;
          widget.onGetSize(box.size.height, box.size.width);
        } catch (e) {
          print('Error');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: stickyKey,
      child: widget.child,
    );
  }
}
