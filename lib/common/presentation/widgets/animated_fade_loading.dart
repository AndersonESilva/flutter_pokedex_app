
import 'package:flutter/material.dart';

class AnimatedFadeLoading extends AnimatedWidget {

  final Animation<double> animation;

  AnimatedFadeLoading({
    super.key,
    required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
