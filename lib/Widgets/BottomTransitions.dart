import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomTransitions extends StatefulWidget {
  bool startLeft;
  Widget child;

  BottomTransitions({this.startLeft=false, @required this.child});

  @override
  _TransitionState createState() => _TransitionState();
}

class _TransitionState extends State<BottomTransitions> with TickerProviderStateMixin{

  AnimationController pageController;
  Animation<Offset> pageAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
    pageAnimation = Tween<Offset>(
      begin: Offset(widget.startLeft ? 1 : -1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: pageController,
      curve: Curves.easeInCubic,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(pageController),
      child: widget.child,
    );
  }
}
