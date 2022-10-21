import 'package:flutter/material.dart';
import 'package:segs/ui/shared/app_colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(100),
        super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  final Size preferredSize;
}

class _CustomAppBarState extends State<CustomAppBar> {
  Color contactColor = AppColors.offWhite.withOpacity(0.3);
  Color aboutColor = AppColors.offWhite.withOpacity(0.3);
  Color projectColor = AppColors.offWhite.withOpacity(0.3);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                  aboutColor = value
                      ? AppColors.primary
                      : AppColors.offWhite.withOpacity(0.3);
                  setState(() {});
                },
                onTap: () => () {},
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
                      : AppColors.offWhite.withOpacity(0.3);
                  setState(() {});
                },
                onTap: () => () {},
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
                      : AppColors.offWhite.withOpacity(0.3);
                  setState(() {});
                },
                onTap: () => () {},
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
    );
  }
}
