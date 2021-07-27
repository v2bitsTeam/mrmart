import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/Widgets/ListAnimation.dart';
import 'package:mr_mart/Widgets/SkeletonBuilder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget withdrawSkeleton({@required BuildContext context, int count = 5}) {
  return ListView.builder(
    itemCount: count,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
    itemBuilder: (context, index) {
      return listAnimation(
        index: index,
        child: skeletonBuilder(
          child: Container(
            padding: EdgeInsets.all(10).copyWith(left: Dimension.padding),
            margin: EdgeInsets.only(bottom: Dimension.padding),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [Colors.white, Colors.transparent]),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Themes.white,
                width: 2,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: Get.width * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Themes.white,
                            width: 2,
                          ),
                        ),
                      ),
                      Container(
                        height: 15,
                        margin: EdgeInsets.only(top: 5),
                        width: Get.width * 0.7,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(7.5),
                          border: Border.all(
                            color: Themes.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  width: Get.width * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Themes.white,
                      width: 2,
                    ),
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
