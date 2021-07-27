import 'package:flutter/cupertino.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/Widgets/ListAnimation.dart';
import 'package:mr_mart/Widgets/SkeletonBuilder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget transportSkeleton({@required BuildContext context, int count = 5}) {
  return ListView.builder(
    itemCount: count,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    itemBuilder: (context, index) {
      return listAnimation(
        index: index,
        child: skeletonBuilder(
          child: Container(
            margin: EdgeInsets.only(
              right: Dimension.size10,
              left: Dimension.size10,
              top: Dimension.size10,
            ),
            padding: EdgeInsets.all(Dimension.size10),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(Dimension.size5),
                border: Border.all()),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.12,
                  height: Get.width * 0.12,
                  margin: EdgeInsets.only(right: Dimension.size10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.size5),
                    color: Themes.white,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width * 0.25,
                      height: Dimension.size14,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimension.size14 / 2),
                        color: Themes.white,
                      ),
                    ),
                    Container(
                      width: Get.width * 0.2,
                      margin: EdgeInsets.only(top: Dimension.size5),
                      height: Dimension.size12,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.size12 / 2),
                          color: Themes.white),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
