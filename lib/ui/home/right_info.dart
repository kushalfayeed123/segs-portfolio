import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class RightColumn extends StatefulWidget {
  const RightColumn({Key? key}) : super(key: key);

  @override
  State<RightColumn> createState() => _RightColumnState();
}

class _RightColumnState extends State<RightColumn>
    with TickerProviderStateMixin {
  Color emailColor = AppColors.offWhite.withOpacity(0.4);
  late double _emailScale;

  late AnimationController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _emailScale = 1 + _emailController.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            onHover: (value) {
              if (value) {
                emailColor = AppColors.primary;
                _emailController.forward();
              } else {
                emailColor = AppColors.offWhite.withOpacity(0.4);
                _emailController.reverse();
              }

              setState(() {});
            },
            child: RotatedBox(
              quarterTurns: 1,
              child: Transform.scale(
                scale: _emailScale,
                child: Text(
                  'segunajanaku617@gmail.com',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      letterSpacing: 4, color: emailColor, fontSize: 12),
                ),
              ),
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