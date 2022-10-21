import 'package:flutter/material.dart';
import 'package:segs/ui/shared/app_colors.dart';

class CustomHero extends StatelessWidget {
  const CustomHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.7,
      margin: const EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hi,',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 16, letterSpacing: 2, color: AppColors.primary),
          ),
          // ShowUpAnimation(
          //   delayStart: const Duration(seconds: 0),
          //   animationDuration: const Duration(seconds: 2),
          //   curve: Curves.bounceIn,
          //   direction: Direction.vertical,
          //   offset: 0.5,
          //   child: Text(
          //     'Hi,',
          //     style: Theme.of(context).textTheme.headline1!.copyWith(
          //         fontSize: 16, letterSpacing: 2, color: AppColors.primary),
          //   ),
          // ),
          Text(
            'I am Segun Ajanaku.',
            style: Theme.of(context).textTheme.headline1,
          ),

          // ShowUpAnimation(
          //   delayStart: const Duration(seconds: 3),
          //   animationDuration: const Duration(seconds: 2),
          //   curve: Curves.bounceIn,
          //   direction: Direction.vertical,
          //   offset: 0.5,
          //   child: Text(
          //     'I am Segun Ajanaku.',
          //     style: Theme.of(context).textTheme.headline1,
          //   ),
          // ),
          Text(
            'I love building things.',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: AppColors.offWhite.withOpacity(0.6)),
          ),
          // ShowUpAnimation(
          //   delayStart: const Duration(seconds: 5),
          //   animationDuration: const Duration(seconds: 2),
          //   curve: Curves.bounceIn,
          //   direction: Direction.vertical,
          //   offset: 0.5,
          //   child: Text(
          //     'I build platform-agnostic applications.',
          //     style: Theme.of(context)
          //         .textTheme
          //         .headline2!
          //         .copyWith(color: AppColors.offWhite.withOpacity(0.6)),
          //   ),
          // ),
        ],
      ),
    );
  }
}
