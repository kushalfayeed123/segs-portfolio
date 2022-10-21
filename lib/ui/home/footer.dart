import 'package:flutter/material.dart';
import 'package:segs/ui/shared/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Text(
          'Built by Segun Ajanaku',
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: AppColors.offWhite.withOpacity(0.4)),
        ),
      ),
    );
  }
}
