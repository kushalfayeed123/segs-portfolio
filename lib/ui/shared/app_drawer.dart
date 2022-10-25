import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:segs/ui/shared/app_colors.dart';

import '../../domain/business/app_business_provider.dart';

class CustomAppDrawer extends ConsumerWidget {
  const CustomAppDrawer({Key? key}) : super(key: key);

  void navigate(BuildContext context, int position, WidgetRef ref) {
    Navigator.pop(context);
    ref.read(activeHomeWidget.state).state = position;
  }

  TextStyle textStyle(Color color, BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyText2!
        .copyWith(color: color, fontSize: 20);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activePosition = ref.watch(activeHomeWidget);

    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height,
        child: Drawer(
          backgroundColor: Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const FaIcon(
                      FontAwesomeIcons.xmark,
                      size: 30,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                menuOption(
                    context,
                    ref,
                    1,
                    activePosition == 1
                        ? AppColors.primary
                        : Colors.transparent,
                    'Home'),
                menuOption(
                    context,
                    ref,
                    2,
                    activePosition == 2
                        ? AppColors.primary
                        : Colors.transparent,
                    'About'),
                menuOption(
                    context,
                    ref,
                    3,
                    activePosition == 3
                        ? AppColors.primary
                        : Colors.transparent,
                    'Projects'),
                menuOption(
                    context,
                    ref,
                    4,
                    activePosition == 4
                        ? AppColors.primary
                        : Colors.transparent,
                    'Contact'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuOption(BuildContext context, WidgetRef ref, int position,
      Color color, String text) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(5)),
        child: GestureDetector(
            onTap: () => navigate(context, position, ref),
            child: Center(
                child: Text(
              text,
              style: textStyle(AppColors.offWhite2, context),
            ))));
  }
}
