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
    Color homeColor = AppColors.offWhite;
    Color contactColor = AppColors.offWhite;
    Color aboutColor = AppColors.offWhite;
    Color projectColor = AppColors.offWhite;
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
                Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                        onTap: () => navigate(context, 1, ref),
                        child: Center(
                            child: Text(
                          'Home',
                          style: textStyle(homeColor, context),
                        )))),
                Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                        onTap: () => navigate(context, 2, ref),
                        child: Center(
                            child: Text(
                          'About',
                          style: textStyle(aboutColor, context),
                        )))),
                Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                        onTap: () => navigate(context, 3, ref),
                        child: Center(
                            child: Text(
                          'Projects',
                          style: textStyle(projectColor, context),
                        )))),
                Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                        onTap: () => navigate(context, 4, ref),
                        child: Center(
                            child: Text(
                          'Contact',
                          style: textStyle(contactColor, context),
                        )))),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(5)),
                  child: InkWell(
                      onTap: () => () {},
                      child: Center(
                          child: Text(
                        'Resume',
                        style: textStyle(AppColors.primary, context),
                      ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
