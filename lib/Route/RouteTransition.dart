import 'package:flutter/material.dart';

class RouteTransition extends PageTransitionsBuilder{
  const RouteTransition();

  @override
  Widget buildTransitions<T>(PageRoute<T> route, BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>
      Align(
        child: SizeTransition(
          sizeFactor: animation,
          child: child,
        ),
      );

}