
import 'package:flutter/material.dart';

class AnimatedSlideFade extends AnimatedWidget {

  late final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: Curves.easeInOut,
  );

  final Animation<double> animation;
  final Widget child;

  AnimatedSlideFade({
    super.key,
    required this.child,
    required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: curvedAnimation.drive(
        Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ),
      ),
      child: FadeTransition(
        opacity: curvedAnimation,
        child: ListTile(
          title: child,
        ),
      ),
    );
  }

}