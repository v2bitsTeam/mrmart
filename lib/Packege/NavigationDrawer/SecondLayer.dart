import 'package:flutter/material.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

SecondLayerState secondLayerState;

class SecondLayer extends StatefulWidget {
  @override
  SecondLayerState createState() => SecondLayerState();

  // openTab() => createState().openTab();
}

class SecondLayerState extends State<SecondLayer> {
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    secondLayerState = this;
    return AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: xoffSet, y: yoffSet)
            .rotate(angle)
            .matrix4,
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimension.Size_30),
            color: Themes.White.withOpacity(0.1)),
        child: Container());
  }
}
