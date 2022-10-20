import 'package:flutter/material.dart';
import 'package:segs/ui/shared/app_colors.dart';

class CenterInfoColumn extends StatelessWidget {
  const CenterInfoColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerSection(context),
        ],
      ),
    );
  }

  Widget headerSection(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hi, I am',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 14, letterSpacing: 2, color: AppColors.primary),
          ),
          Text(
            'Segun Ajanaku.',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            'I build platform-agnostic applications.',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: AppColors.offWhite.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}
