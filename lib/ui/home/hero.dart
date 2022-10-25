import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segs/domain/business/app_business_provider.dart';
import 'package:segs/domain/core/app_data_provider.dart';
import 'package:segs/ui/shared/app_colors.dart';
import 'package:segs/ui/shared/text_widget.dart';

class CustomHero extends ConsumerWidget {
  const CustomHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(currentUserId);
    final firstName = ref.watch(
        userDataProvider(id).select((value) => value.value?.firstName ?? ''));
    final lastName = ref.watch(
        userDataProvider(id).select((value) => value.value?.lastName ?? ''));
    final introText = ref.watch(
        userDataProvider(id).select((value) => value.value?.introText ?? ''));
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.6,
      margin: const EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(
              text: 'Hi',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 20, letterSpacing: 2, color: AppColors.primary)),
          const SizedBox(
            height: 20,
          ),
          CustomTextWidget(
              text: 'I am $firstName $lastName.',
              style: Theme.of(context).textTheme.headline1!),
          const SizedBox(
            height: 20,
          ),
          CustomTextWidget(
            text: introText,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: AppColors.offWhite2,
                ),
          )
        ],
      ),
    );
  }
}
