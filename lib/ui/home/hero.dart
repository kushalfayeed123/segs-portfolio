import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segs/domain/core/app_data_provider.dart';
import 'package:segs/ui/shared/app_colors.dart';
import 'package:show_up_animation/show_up_animation.dart';

class CustomHero extends ConsumerWidget {
  const CustomHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstName = ref.watch(userDataProvider('7ovTA1XwXTmbEc3guCKC')
        .select((value) => value.value?.firstName ?? ''));
    final lastName = ref.watch(userDataProvider('7ovTA1XwXTmbEc3guCKC')
        .select((value) => value.value?.lastName ?? ''));
    final introText = ref.watch(userDataProvider('7ovTA1XwXTmbEc3guCKC')
        .select((value) => value.value?.introText ?? ''));
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.7,
      margin: const EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   'Hi,',
          //   style: Theme.of(context).textTheme.headline1!.copyWith(
          //       fontSize: 16, letterSpacing: 2, color: AppColors.primary),
          // ),
          ShowUpAnimation(
            delayStart: const Duration(seconds: 1),
            animationDuration: const Duration(seconds: 2),
            curve: Curves.bounceIn,
            direction: Direction.vertical,
            offset: 0.5,
            child: Text(
              'Hi,',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 16, letterSpacing: 2, color: AppColors.primary),
            ),
          ),
          // Text(
          //   'I am Segun Ajanaku.',
          //   style: Theme.of(context).textTheme.headline1,
          // ),

          ShowUpAnimation(
            delayStart: const Duration(seconds: 1),
            animationDuration: const Duration(seconds: 2),
            curve: Curves.bounceIn,
            direction: Direction.vertical,
            offset: 0.5,
            child: Text(
              'I am $firstName $lastName.',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          // Text(
          //   'I love building things.',
          //   style: Theme.of(context)
          //       .textTheme
          //       .headline6!
          //       .copyWith(color: AppColors.offWhite.withOpacity(0.6)),
          // ),
          ShowUpAnimation(
            delayStart: const Duration(seconds: 1),
            animationDuration: const Duration(seconds: 2),
            curve: Curves.bounceIn,
            direction: Direction.vertical,
            offset: 0.5,
            child: Text(
              introText,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: AppColors.offWhite.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
