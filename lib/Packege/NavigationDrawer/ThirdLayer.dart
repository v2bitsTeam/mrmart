import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

ThirdLayerState thirdLayerState;

class ThirdLayer extends StatefulWidget {
  @override
  ThirdLayerState createState() => ThirdLayerState();
}

class ThirdLayerState extends State<ThirdLayer> {
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    thirdLayerState = this;
    return AnimatedContainer(
      transform: Matrix4Transform()
          .translate(x: xoffSet, y: yoffSet)
          .rotate(angle)
          .matrix4,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimension.size30),
        color: Themes.white.withOpacity(0.1),
      ),
      child: Container(),
    );
  }
}
