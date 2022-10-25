import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segs/domain/business/app_business_provider.dart';
import 'package:segs/domain/core/app_data_provider.dart';

import '../shared/app_colors.dart';

class RightColumn extends ConsumerStatefulWidget {
  const RightColumn({Key? key}) : super(key: key);

  @override
  RightColumnState createState() => RightColumnState();
}

class RightColumnState extends ConsumerState<RightColumn>
    with TickerProviderStateMixin {
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
    final id = ref.watch(currentUserId);
    final email = ref.watch(
        userDataProvider(id).select((value) => value.value?.email ?? ''));
    final isEmailActive = ref.watch(emailActive);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: InkWell(
            onTap: () => ref.watch(launchMail(email)),
            hoverColor: Colors.transparent,
            onHover: (value) {
              if (value) {
                _emailController.forward();
              } else {
                _emailController.reverse();
              }
              ref.watch(emailActive.state).state = value;
            },
            child: RotatedBox(
              quarterTurns: 1,
              child: Transform.scale(
                scale: _emailScale,
                child: Text(
                  email,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      letterSpacing: 4,
                      color: isEmailActive
                          ? AppColors.primary
                          : AppColors.offWhite2,
                      fontSize: 12),
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
              border: Border.all(color: AppColors.offWhite2, width: 0.2)),
        ),
      ],
    );
  }
}
