import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/Widgets/ListAnimation.dart';
import 'package:mr_mart/Widgets/SkeletonBuilder.dart';
import 'package:flutter/material.dart';

Widget profileSkeleton({@required BuildContext context, int count = 5}) {
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
            margin: EdgeInsets.only(bottom: Dimension.padding),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(Dimension.size6),
              border: Border.all(width: 2),
            ),
            child: ListTile(
              leading: Container(
                height: Dimension.size40,
                width: Dimension.size40,
                decoration: BoxDecoration(
                  color: Themes.white,
                  shape: BoxShape.circle,
                ),
              ),
              title: Container(
                height: Dimension.size20,
                decoration: BoxDecoration(
                    color: Themes.white,
                    borderRadius: BorderRadius.circular(Dimension.size10)),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Themes.textColor,
              ),
            ),
          ),
        ),
      );
    },
  );
}
