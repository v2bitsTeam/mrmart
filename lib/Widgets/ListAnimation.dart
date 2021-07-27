import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

enum AnimationFrom { top, bottom }

listAnimation({
  @required Widget child,
  @required int index,
  AnimationFrom animationFrom = AnimationFrom.top,
  int delay,
}) {
  return AnimationConfiguration.staggeredList(
    position: index,
    duration: Duration(milliseconds: delay ?? AppConstant.animationDelay),
    child: SlideAnimation(
      verticalOffset: animationFrom == AnimationFrom.top ? -50.0 : 50,
      child: FadeInAnimation(
        child: child,
      ),
    ),
  );
}
