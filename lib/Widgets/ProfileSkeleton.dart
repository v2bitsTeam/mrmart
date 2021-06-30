import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/Widgets/GridAnimation.dart';
import 'package:MrMart/Widgets/ListAnimation.dart';
import 'package:MrMart/Widgets/SkeletonBuilder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:MrMart/main.dart';

Widget ProfileSkeleton({@required BuildContext context, int count = 5}) {
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
            margin: EdgeInsets.only(bottom: Dimension.Padding),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(Dimension.Size_6),
                border: Border.all(width: 2)),
            child: ListTile(
              leading: Container(
                height: Dimension.Size_40,
                width: Dimension.Size_40,
                decoration:
                    BoxDecoration(color: Themes.White, shape: BoxShape.circle),
              ),
              title: Container(
                height: Dimension.Size_20,
                decoration: BoxDecoration(
                    color: Themes.White,
                    borderRadius: BorderRadius.circular(Dimension.Size_10)),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Themes.Text_Color,
              ),
            ),
          )));
    },
  );
}
