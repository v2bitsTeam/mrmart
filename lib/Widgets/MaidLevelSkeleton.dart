import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/Widgets/GridAnimation.dart';
import 'package:mr_mart/Widgets/SkeletonBuilder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget maidLevelSkeleton({@required BuildContext context, int count = 5}) {
  return ListView.builder(
    itemCount: count,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.zero,
    itemBuilder: (context, index) {
      return gridAnimation(
        column: count,
        index: index,
        child: skeletonBuilder(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width * 0.2,
                height: Get.width * 0.20,
                margin: EdgeInsets.only(right: Dimension.size10),
                decoration: BoxDecoration(
                  color: Themes.white,
                  borderRadius: BorderRadius.circular(Dimension.size5),
                ),
              ),
              Container(
                width: Get.width * 0.20,
                height: Get.width * 0.035,
                margin: EdgeInsets.only(right: Dimension.size10),
                decoration: BoxDecoration(
                    color: Themes.white,
                    borderRadius: BorderRadius.circular(Dimension.size20)),
              ),
            ],
          ),
        ),
      );
    },
  );
}
