import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:segs/ui/shared/app_colors.dart';
import 'package:show_up_animation/show_up_animation.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delayStart: const Duration(seconds: 1),
      animationDuration: const Duration(seconds: 2),
      curve: Curves.easeIn,
      direction: Direction.horizontal,
      offset: 1,
      child: Container(
        width: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? MediaQuery.of(context).size.width * 0.35
            : MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
            border: Border.all(
          color: AppColors.primary,
          width: 0.05,
        )),
      ),
    );
  }
}
