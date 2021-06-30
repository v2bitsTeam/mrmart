import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/app_components/AppConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

enum AnimationFrom { top, bottom }
ListAnimation(
    {@required Widget child,
    @required int index,
    AnimationFrom animationFrom = AnimationFrom.top,
    int delay}) {
  return AnimationConfiguration.staggeredList(
      position: index,
      duration: Duration(milliseconds: delay ?? AppConstant.AnimationDelay),
      child: SlideAnimation(
          verticalOffset: animationFrom == AnimationFrom.top ? -50.0 : 50,
          child: FadeInAnimation(
            child: child,
          )));
}
