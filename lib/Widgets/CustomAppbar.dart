import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/Widgets/TopShape.dart';

import '../main.dart';

Widget CustomAppbar(
    {@required BuildContext context,
    @required String title,
    Widget action,
    var returnData,
    @required Widget topChild}) {
  return Stack(
    children: [
      Positioned.fill(
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: Themes.Primary,
            )),
            Image.asset(
              'assets/images/header.png',
              width: Get.width,
              fit: BoxFit.fitWidth,
              color: Themes.Primary,
            ),
          ],
        ),
      ),
      Positioned(
          top: paddingTop,
          width: Get.width,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: Dimension.Size_5,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.back(result: returnData);
                    },
                  ),
                  Expanded(
                      child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline1.copyWith(
                        color: Themes.White,
                        fontSize: Dimension.Size_20,
                        fontWeight: Dimension.textMedium),
                    textAlign: TextAlign.center,
                  )),
                  action != null
                      ? action
                      : SizedBox(
                          width: Get.width * 0.1,
                        )
                ],
              ),
              topChild
            ],
          ))
    ],
  );
}
