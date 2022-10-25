import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:segs/domain/business/app_business_provider.dart';
import 'package:segs/ui/shared/app_colors.dart';
import 'package:show_up_animation/show_up_animation.dart';

class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(80),
        super(key: key);

  @override
  CustomAppBarState createState() => CustomAppBarState();

  @override
  final Size preferredSize;
}

class CustomAppBarState extends ConsumerState<CustomAppBar> {
  void navigate(BuildContext context, int position, WidgetRef ref) {
    ref.read(activeHomeWidget.state).state = position;
  }

  TextStyle textStyle(Color color, BuildContext context) {
    return Theme.of(context).textTheme.bodyText2!.copyWith(color: color);
  }

  @override
  Widget build(BuildContext context) {
    final activePosition = ref.watch(activeMenuWidget);

    return ShowUpAnimation(
      delayStart: const Duration(seconds: 1),
      animationDuration: const Duration(seconds: 2),
      curve: Curves.bounceIn,
      direction: Direction.vertical,
      offset: -1,
      child: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(10),
          child: Image.asset(
            'assets/images/logo2.png',
            fit: BoxFit.cover,
          ),
        ),
        leadingWidth: 100,
        actions: [
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [
              Condition.smallerThan(name: DESKTOP),
            ],
            child: InkWell(
              radius: 100,
              onTap: () => Scaffold.of(context).openEndDrawer(),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20, top: 25, right: 20),
                child: const FaIcon(
                  FontAwesomeIcons.barsStaggered,
                  color: AppColors.primary,
                  size: 30,
                ),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [
              Condition.largerThan(name: TABLET),
            ],
            child: Row(
              children: [
                menuOption(
                    context,
                    ref,
                    1,
                    activePosition == 1
                        ? AppColors.primary
                        : AppColors.offWhite2,
                    'Home'),
                menuOption(
                    context,
                    ref,
                    2,
                    activePosition == 2
                        ? AppColors.primary
                        : AppColors.offWhite2,
                    'About'),
                menuOption(
                    context,
                    ref,
                    3,
                    activePosition == 3
                        ? AppColors.primary
                        : AppColors.offWhite2,
                    'Projects'),
                menuOption(
                    context,
                    ref,
                    4,
                    activePosition == 4
                        ? AppColors.primary
                        : AppColors.offWhite2,
                    'Contact'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget menuOption(BuildContext context, WidgetRef ref, int position,
      Color color, String text) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: InkWell(
            hoverColor: Colors.transparent,
            onHover: (value) {
              if (value) {
                ref.watch(activeMenuWidget.state).state = position;
              } else {
                ref.watch(activeMenuWidget.state).state = 0;
              }
            },
            onTap: () => navigate(context, position, ref),
            child: Center(
                child: Text(
              text,
              style: textStyle(color, context),
            ))));
  }
}
