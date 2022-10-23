import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segs/domain/business/app_business_provider.dart';
import 'package:segs/ui/home/home.dart';
import 'package:segs/ui/shared/app_colors.dart';
import 'package:show_up_animation/show_up_animation.dart';

class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(100),
        super(key: key);

  @override
  CustomAppBarState createState() => CustomAppBarState();

  @override
  final Size preferredSize;
}

class CustomAppBarState extends ConsumerState<CustomAppBar> {
  Color homeColor = AppColors.offWhite.withOpacity(0.4);
  Color contactColor = AppColors.offWhite.withOpacity(0.4);
  Color aboutColor = AppColors.offWhite.withOpacity(0.4);
  Color projectColor = AppColors.offWhite.withOpacity(0.4);

  @override
  Widget build(BuildContext context) {
    final widgetNumber = ref.read(activeHomeWidget);

    return ShowUpAnimation(
      delayStart: const Duration(seconds: 1),
      animationDuration: const Duration(seconds: 2),
      curve: Curves.bounceIn,
      direction: Direction.vertical,
      offset: -1,
      child: AppBar(
        leading: Image.asset(
          'assets/images/logo2.png',
          fit: BoxFit.contain,
          height: 50,
          width: 50,
        ),
        leadingWidth: 100,
        actions: [
          Container(
              width: 100,
              margin: const EdgeInsets.only(top: 30, bottom: 30),
              padding: const EdgeInsets.only(
                right: 40,
              ),
              child: InkWell(
                  hoverColor: Colors.transparent,
                  onHover: (value) {
                    homeColor = value
                        ? AppColors.primary
                        : AppColors.offWhite.withOpacity(0.4);
                    setState(() {});
                  },
                  onTap: () => ref.read(activeHomeWidget.state).state = 1,
                  child: Center(
                      child: Text(
                    'Home',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: homeColor),
                  )))),
          Container(
              width: 100,
              margin: const EdgeInsets.only(top: 30, bottom: 30),
              padding: const EdgeInsets.only(
                right: 40,
              ),
              child: InkWell(
                  hoverColor: Colors.transparent,
                  onHover: (value) {
                    aboutColor = value
                        ? AppColors.primary
                        : AppColors.offWhite.withOpacity(0.4);
                    setState(() {});
                  },
                  onTap: () => ref.read(activeHomeWidget.state).state = 2,
                  child: Center(
                      child: Text(
                    'About',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: aboutColor),
                  )))),
          Container(
              width: 100,
              margin: const EdgeInsets.only(top: 30, bottom: 30),
              padding: const EdgeInsets.only(
                right: 40,
              ),
              child: InkWell(
                  hoverColor: Colors.transparent,
                  onHover: (value) {
                    projectColor = value
                        ? AppColors.primary
                        : AppColors.offWhite.withOpacity(0.4);
                    setState(() {});
                  },
                  onTap: () => ref.read(activeHomeWidget.state).state = 3,
                  child: Center(
                      child: Text(
                    'Projects',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: projectColor),
                  )))),
          Container(
              width: 100,
              margin: const EdgeInsets.only(top: 30, bottom: 30),
              padding: const EdgeInsets.only(
                right: 40,
              ),
              child: InkWell(
                  hoverColor: Colors.transparent,
                  onHover: (value) {
                    contactColor = value
                        ? AppColors.primary
                        : AppColors.offWhite.withOpacity(0.4);
                    setState(() {});
                  },
                  onTap: () => ref.read(activeHomeWidget.state).state = 4,
                  child: Center(
                      child: Text(
                    'Contact',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: contactColor),
                  )))),
          Container(
            margin: const EdgeInsets.only(right: 40, top: 30, bottom: 30),
            width: 90,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                borderRadius: BorderRadius.circular(5)),
            child: InkWell(
                onTap: () => () {},
                child: Center(
                    child: Text(
                  'Resume',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: AppColors.primary),
                ))),
          ),
        ],
      ),
    );
  }
}
