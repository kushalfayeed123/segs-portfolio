import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:segs/ui/home/center_info.dart';
import 'package:segs/ui/shared/app_bar.dart';
import 'package:segs/ui/shared/app_colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const routename = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal:
                ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 20 : 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? const SizedBox.shrink()
                : const LeftInfoColumn(),
            const CenterInfoColumn(),
            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? const SizedBox.shrink()
                : const RightInfoColumn(),
          ],
        ),
      ),
    );
  }
}

class LeftInfoColumn extends StatelessWidget {
  const LeftInfoColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.offWhite, width: 0.2)),
        ),
      ],
    );
  }
}

class RightInfoColumn extends StatelessWidget {
  const RightInfoColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: RotatedBox(
            quarterTurns: 1,
            child: Text(
              'segunajanaku617@gmail.com',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  letterSpacing: 4, color: AppColors.offWhite, fontSize: 10),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.offWhite, width: 0.2)),
        ),
      ],
    );
  }
}
