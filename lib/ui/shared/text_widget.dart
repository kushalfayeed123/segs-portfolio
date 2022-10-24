import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:show_up_animation/show_up_animation.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  const CustomTextWidget({Key? key, required this.text, required this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delayStart: const Duration(seconds: 1),
      animationDuration: const Duration(seconds: 2),
      curve: Curves.bounceIn,
      direction: Direction.vertical,
      offset: 0.5,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: style,
      ),
    );
  }
}
