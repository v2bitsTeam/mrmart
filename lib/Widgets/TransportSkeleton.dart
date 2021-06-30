import 'package:flutter/cupertino.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/Widgets/ListAnimation.dart';
import 'package:MrMart/Widgets/SkeletonBuilder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget TransportSkeleton({@required BuildContext context, int count = 5}) {
  return ListView.builder(
    itemCount: count,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    itemBuilder: (context, index) {
      return ListAnimation(
          index: index,
          child: SkeletonBuilder(
              child: Container(
            margin: EdgeInsets.only(
                right: Dimension.Size_10,
                left: Dimension.Size_10,
                top: Dimension.Size_10),
            padding: EdgeInsets.all(Dimension.Size_10),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(Dimension.Size_5),
                border: Border.all()),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.12,
                  height: Get.width * 0.12,
                  margin: EdgeInsets.only(right: Dimension.Size_10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.Size_5),
                      color: Themes.White),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width * 0.25,
                      height: Dimension.Size_14,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.Size_14 / 2),
                          color: Themes.White),
                    ),
                    Container(
                      width: Get.width * 0.2,
                      margin: EdgeInsets.only(top: Dimension.Size_5),
                      height: Dimension.Size_12,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.Size_12 / 2),
                          color: Themes.White),
                    ),
                  ],
                )
              ],
            ),
          )));
    },
  );
}
