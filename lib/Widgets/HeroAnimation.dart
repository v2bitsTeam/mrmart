import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget HeroAnimation({@required String tag,@required Widget child}){
  return Hero(
    tag: tag,
    flightShuttleBuilder: (BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,){

      return SingleChildScrollView(
        child: fromHeroContext.widget,
      );
    },
    child: Material(
      color: Colors.transparent,
      child: child,
    ),
  );
}