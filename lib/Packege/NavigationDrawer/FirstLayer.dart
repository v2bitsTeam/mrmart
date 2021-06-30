import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

class FirstLayer extends StatelessWidget {
  Widget child;

  FirstLayer(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          color: Themes.Primary,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/back.png',
            ),
            fit: BoxFit.cover,
          )),
      child: child,
    );
  }
}
