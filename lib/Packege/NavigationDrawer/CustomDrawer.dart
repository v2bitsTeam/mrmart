import 'package:get/get.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/main.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'FirstLayer.dart';
import 'SecondLayer.dart';
import 'ThirdLayer.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final Widget body;
  final Widget drawer;

  CustomDrawer({@required this.body, @required this.drawer});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with TickerProviderStateMixin {
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;
  AnimationController navigationController;

  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    navigationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 450,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FirstLayer(widget.drawer),
          SecondLayer(),
          ThirdLayer(),
          Positioned.fill(
            child: AnimatedContainer(
              transform: Matrix4Transform()
                  .translate(x: xoffSet, y: yoffSet)
                  .rotate(angle)
                  .matrix4,
              duration: Duration(milliseconds: 300),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Themes.background,
                  borderRadius: BorderRadius.circular(
                    isOpen ? Dimension.size30 : 0,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(child: widget.body),
                    Positioned(
                      top: paddingTop - 20,
                      left: Dimension.size5,
                      child: IconButton(
                        icon: AnimatedIcon(
                          icon: AnimatedIcons.menu_arrow,
                          progress: navigationController,
                          color: Themes.white,
                        ),
                        onPressed: () {
                          changeLayout();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeLayout() {
    if (isOpen)
      navigationController.reverse();
    else
      navigationController.forward();

    xoffSet = isOpen ? 0 : Get.width * 0.65;
    yoffSet = isOpen ? 0 : Get.height * 0.1;
    angle = isOpen ? 0 : -0.15;

    secondLayerState.setState(() {
      secondLayerState.xoffSet = isOpen ? 0 : Get.width * 0.6;
      secondLayerState.yoffSet = isOpen ? 0 : Get.height * 0.15;
      secondLayerState.angle = isOpen ? 0 : -0.15;
    });
    thirdLayerState.setState(() {
      thirdLayerState.xoffSet = isOpen ? 0 : Get.width * 0.625;
      thirdLayerState.yoffSet = isOpen ? 0 : Get.height * 0.125;
      thirdLayerState.angle = isOpen ? 0 : -0.15;
    });
    isOpen = !isOpen;
    setState(() {});
  }
}
