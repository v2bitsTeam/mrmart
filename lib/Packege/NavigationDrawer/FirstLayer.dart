import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

class FirstLayer extends StatelessWidget {
  final Widget child;

  FirstLayer(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        color: Themes.primary,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/back.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
