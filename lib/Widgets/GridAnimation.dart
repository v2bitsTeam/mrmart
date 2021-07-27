import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

gridAnimation({
  @required Widget child,
  @required int index,
  int column = 2,
}) {
  return AnimationConfiguration.staggeredGrid(
    position: index,
    duration: Duration(milliseconds: AppConstant.animationDelay),
    columnCount: column,
    child: ScaleAnimation(
      child: FadeInAnimation(
        child: child,
      ),
    ),
  );
}
