import 'package:flutter/material.dart';

class Transitions extends StatefulWidget {
  final bool startLeft;
  final Widget child;

  Transitions({
    this.startLeft = false,
    @required this.child,
  });

  @override
  _TransitionState createState() => _TransitionState();
}

class _TransitionState extends State<Transitions>
    with TickerProviderStateMixin {
  AnimationController pageController;
  Animation<Offset> pageAnimation;

  @override
  void initState() {
    super.initState();
    pageController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
    pageAnimation = Tween<Offset>(
      begin: Offset(widget.startLeft ? 1 : -1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: pageController,
        curve: Curves.easeInCubic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: pageAnimation,
      textDirection: TextDirection.rtl,
      child: widget.child,
    );
  }
}
