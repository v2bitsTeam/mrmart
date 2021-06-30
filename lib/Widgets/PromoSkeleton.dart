import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/Widgets/GridAnimation.dart';
import 'package:MrMart/Widgets/ListAnimation.dart';
import 'package:MrMart/Widgets/SkeletonBuilder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:MrMart/main.dart';

Widget PromoSkeleton({@required BuildContext context, int count = 5}) {
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
            margin: EdgeInsets.only(top: Dimension.Size_10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.12,
                  height: Get.width * 0.12,
                  margin: EdgeInsets.only(right: Dimension.Size_10),
                  decoration: BoxDecoration(
                      color: Themes.White,
                      borderRadius: BorderRadius.circular(Dimension.Size_5)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width * 0.5,
                        height: Dimension.Size_16,
                        decoration: BoxDecoration(
                            color: Themes.White,
                            borderRadius:
                                BorderRadius.circular(Dimension.Size_8)),
                      ),
                      Container(
                        width: Get.width * 0.3,
                        height: Dimension.Size_10,
                        margin: EdgeInsets.only(top: Dimension.Size_10),
                        decoration: BoxDecoration(
                            color: Themes.White,
                            borderRadius:
                                BorderRadius.circular(Dimension.Size_5)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )));
    },
  );
}
