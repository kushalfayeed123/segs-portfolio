import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:segs/ui/home/center_info.dart';
import 'package:segs/ui/home/left_info.dart';
import 'package:segs/ui/home/right_info.dart';
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

class _HomeState extends State<Home> {
  double twitterSize = 20;

  ScrollController scrollController = ScrollController();
  var containerKey = GlobalKey();
  var container2Key = GlobalKey();
  var container3Key = GlobalKey();
  var container4Key = GlobalKey();

  int currentPosition = 1;

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
            SingleChildScrollView(
              controller: scrollController,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
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
            ),
            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? const SizedBox.shrink()
                : const Positioned(left: 1, bottom: 1, child: LeftColumn()),
            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? const SizedBox.shrink()
                : const Positioned(right: 5, bottom: 1, child: RightColumn()),
          ],
        ),
      ),
    );
  }
}
