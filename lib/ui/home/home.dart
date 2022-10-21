import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:segs/ui/home/center_info.dart';
import 'package:segs/ui/shared/app_bar.dart';
import 'package:segs/ui/shared/app_colors.dart';

import 'about.dart';
import 'contact.dart';
import 'footer.dart';
import 'hero.dart';
import 'projects.dart';

class Home extends StatefulWidget {
  final int? widgetNumber;
  const Home({Key? key, required this.widgetNumber}) : super(key: key);
  static const routename = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Color emailColor = AppColors.offWhite.withOpacity(0.4);
  Color twitterColor = AppColors.offWhite.withOpacity(0.4);
  Color instagramColor = AppColors.offWhite.withOpacity(0.4);
  Color linkedinColor = AppColors.offWhite.withOpacity(0.4);
  Color gitHubColor = AppColors.offWhite.withOpacity(0.4);

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

  ScrollController scrollController = ScrollController();
  var containerKey = GlobalKey();
  var container2Key = GlobalKey();
  var container3Key = GlobalKey();
  var container4Key = GlobalKey();

  int currentPosition = 1;
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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  scrollPosition(int position) {
    setState(() {
      currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    _emailScale = 1 + _emailController.value;
    _twitterScale = 1 + _twitterController.value;
    _instagramScale = 1 + _instagramController.value;
    _linkedInScale = 1 + _linkedinController.value;
    _githubScale = 1 + _githubController.value;

    Future.delayed(const Duration(milliseconds: 100), () {
      switch (currentPosition) {
        case 1:
          Scrollable.ensureVisible(
            containerKey.currentContext!,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
          );
          break;
        case 2:
          Scrollable.ensureVisible(
            container2Key.currentContext!,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
          );
          break;
        case 3:
          Scrollable.ensureVisible(
            container3Key.currentContext!,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
          );
          break;
        case 4:
          Scrollable.ensureVisible(
            container4Key.currentContext!,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
          );
          break;
        default:
          Scrollable.ensureVisible(
            containerKey.currentContext!,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
          );
      }
    });

    return Scaffold(
      appBar: CustomAppBar(
        pageInstanceFunction: (value) {
          scrollPosition(value);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal:
                ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 20 : 40),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? const SizedBox.shrink()
                : Positioned(left: -1, bottom: 1, child: leftColumn()),
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomHero(
                    key: containerKey,
                  ),
                  About(
                    key: container2Key,
                  ),
                  Projects(
                    key: container3Key,
                  ),
                  Contact(
                    key: container4Key,
                  ),
                  const Footer()
                ],
              ),
            ),
            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? const SizedBox.shrink()
                : Positioned(right: 5, bottom: 1, child: rightColumn()),
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
              twitterColor = AppColors.offWhite.withOpacity(0.4);
              _twitterController.reverse();
            }
            setState(() {});
          },
          child: Transform.scale(
            scale: _twitterScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FaIcon(
                  FontAwesomeIcons.twitter,
                  color: twitterColor,
                  size: 20,
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
              instagramColor = AppColors.offWhite.withOpacity(0.4);
              _instagramController.reverse();
            }
            setState(() {});
          },
          child: Transform.scale(
            scale: _instagramScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: instagramColor,
                  size: 20,
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
              linkedinColor = AppColors.offWhite.withOpacity(0.4);
              _linkedinController.reverse();
            }
            setState(() {});
          },
          child: Transform.scale(
            scale: _linkedInScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FaIcon(
                  FontAwesomeIcons.linkedinIn,
                  color: linkedinColor,
                  size: 20,
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
              gitHubColor = AppColors.offWhite.withOpacity(0.4);
              _githubController.reverse();
            }
            setState(() {});
          },
          child: Transform.scale(
            scale: _githubScale,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FaIcon(
                  FontAwesomeIcons.github,
                  color: gitHubColor,
                  size: 20,
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
