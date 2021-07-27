import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/Widgets/ListAnimation.dart';
import 'package:mr_mart/Widgets/SkeletonBuilder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget promoSkeleton({@required BuildContext context, int count = 5}) {
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
            margin: EdgeInsets.only(top: Dimension.size10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.12,
                  height: Get.width * 0.12,
                  margin: EdgeInsets.only(right: Dimension.size10),
                  decoration: BoxDecoration(
                    color: Themes.white,
                    borderRadius: BorderRadius.circular(Dimension.size5),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width * 0.5,
                        height: Dimension.size16,
                        decoration: BoxDecoration(
                          color: Themes.white,
                          borderRadius: BorderRadius.circular(Dimension.size8),
                        ),
                      ),
                      Container(
                        width: Get.width * 0.3,
                        height: Dimension.size10,
                        margin: EdgeInsets.only(top: Dimension.size10),
                        decoration: BoxDecoration(
                          color: Themes.white,
                          borderRadius: BorderRadius.circular(Dimension.size5),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
