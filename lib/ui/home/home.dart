import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:segs/ui/home/center_info.dart';
import 'package:segs/ui/shared/app_bar.dart';
import 'package:segs/ui/shared/app_colors.dart';

class Home extends StatefulWidget {
  final int? widgetNumber;
  const Home({Key? key, required this.widgetNumber}) : super(key: key);
  static const routename = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Color emailColor = AppColors.offWhite.withOpacity(0.3);
  Color twitterColor = AppColors.offWhite.withOpacity(0.3);
  Color instagramColor = AppColors.offWhite.withOpacity(0.3);
  Color linkedinColor = AppColors.offWhite.withOpacity(0.3);
  Color gitHubColor = AppColors.offWhite.withOpacity(0.3);

  double twitterSize = 20;

  late double _emailScale;
  late double _twitterScale;
  late double _instagramScale;
  late double _linkedInScale;
  late double _githubScale;
  late AnimationController _emailController;
  late AnimationController _twitterController;
  late AnimationController _instagramController;
  late AnimationController _linkedinController;
  late AnimationController _githubController;
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
    _twitterController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    _instagramController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    _linkedinController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    _githubController = AnimationController(
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
    _twitterController.dispose();
    _instagramController.dispose();
    _linkedinController.dispose();
    _githubController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _emailScale = 1 + _emailController.value;
    _twitterScale = 1 + _twitterController.value;
    _instagramScale = 1 + _instagramController.value;
    _linkedInScale = 1 + _linkedinController.value;
    _githubScale = 1 + _githubController.value;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal:
                ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 20 : 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? const SizedBox.shrink()
                : leftColumn(),
            CenterInfoColumn(
              widgetNumber: widget.widgetNumber,
            ),
            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? const SizedBox.shrink()
                : rightColumn(),
          ],
        ),
      ),
    );
  }

  Widget rightColumn() {
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
                emailColor = AppColors.offWhite.withOpacity(0.3);
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

  Widget leftColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          onHover: (value) {
            if (value) {
              twitterColor = AppColors.primary;
              _twitterController.forward();
            } else {
              twitterColor = AppColors.offWhite.withOpacity(0.3);
              _twitterController.reverse();
            }
            setState(() {});
          },
          child: Transform.scale(
            scale: _twitterScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  'assets/images/twitter.png',
                  width: twitterSize,
                  fit: BoxFit.contain,
                  color: twitterColor,
                )),
          ),
        ),
        InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          onHover: (value) {
            if (value) {
              instagramColor = AppColors.primary;
              _instagramController.forward();
            } else {
              instagramColor = AppColors.offWhite.withOpacity(0.3);
              _instagramController.reverse();
            }
            setState(() {});
          },
          child: Transform.scale(
            scale: _instagramScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  'assets/images/instagram.png',
                  width: 20,
                  fit: BoxFit.contain,
                  color: instagramColor,
                )),
          ),
        ),
        InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          onHover: (value) {
            if (value) {
              linkedinColor = AppColors.primary;
              _linkedinController.forward();
            } else {
              linkedinColor = AppColors.offWhite.withOpacity(0.3);
              _linkedinController.reverse();
            }
            setState(() {});
          },
          child: Transform.scale(
            scale: _linkedInScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  'assets/images/linkedin.png',
                  width: 20,
                  fit: BoxFit.contain,
                  color: linkedinColor,
                )),
          ),
        ),
        InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          onHover: (value) {
            if (value) {
              gitHubColor = AppColors.primary;
              _githubController.forward();
            } else {
              gitHubColor = AppColors.offWhite.withOpacity(0.3);
              _githubController.reverse();
            }
            setState(() {});
          },
          child: Transform.scale(
            scale: _githubScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  'assets/images/github.png',
                  width: 20,
                  fit: BoxFit.contain,
                  color: gitHubColor,
                )),
          ),
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
