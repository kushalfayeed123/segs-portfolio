import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segs/domain/core/app_data_provider.dart';

import '../shared/app_colors.dart';

class RightColumn extends ConsumerStatefulWidget {
  const RightColumn({Key? key}) : super(key: key);

  @override
  RightColumnState createState() => RightColumnState();
}

class RightColumnState extends ConsumerState<RightColumn>
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
    final email = ref.watch(userDataProvider('7ovTA1XwXTmbEc3guCKC')
        .select((value) => value.value?.email ?? ''));

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
                  email,
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
