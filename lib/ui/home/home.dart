import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:segs/domain/core/app_data_provider.dart';
import 'package:segs/ui/home/left_info.dart';
import 'package:segs/ui/home/right_info.dart';
import 'package:segs/ui/shared/app_bar.dart';
import 'package:show_up_animation/show_up_animation.dart';

import 'about.dart';
import 'contact.dart';
import 'footer.dart';
import 'hero.dart';
import 'projects.dart';

class Home extends ConsumerStatefulWidget {
  final int? widgetNumber;
  const Home({Key? key, required this.widgetNumber}) : super(key: key);
  static const routename = '/home';

  @override
  HomeState createState() => HomeState();
}

class HomeState extends ConsumerState<Home> with TickerProviderStateMixin {
  double twitterSize = 20;
  bool animate = true;

  ScrollController scrollController = ScrollController();
  var containerKey = GlobalKey();
  var container2Key = GlobalKey();
  var container3Key = GlobalKey();
  var container4Key = GlobalKey();

  int currentPosition = 1;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        animate = false;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void scrollPosition(int position) {
    setState(() {
      currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(userDataProvider('7ovTA1XwXTmbEc3guCKC'));
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

    return data.when(
      data: (data) {
        return Scaffold(
          appBar: CustomAppBar(
            pageInstanceFunction: (value) {
              scrollPosition(value);
            },
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                    ? 20
                    : 40),
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                AnimatedOpacity(
                  opacity: animate ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Lottie.asset('assets/animations/loader.json',
                        height: 70, width: 70, animate: animate),
                  ),
                ),
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
                    : Positioned(
                        left: 1,
                        bottom: 1,
                        child: ShowUpAnimation(
                            delayStart: const Duration(seconds: 1),
                            animationDuration: const Duration(seconds: 2),
                            curve: Curves.easeIn,
                            direction: Direction.horizontal,
                            offset: -5,
                            child: const LeftColumn())),
                ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                    ? const SizedBox.shrink()
                    : Positioned(
                        right: 5,
                        bottom: 1,
                        child: ShowUpAnimation(
                            delayStart: const Duration(seconds: 1),
                            animationDuration: const Duration(seconds: 2),
                            curve: Curves.easeIn,
                            offset: 5,
                            direction: Direction.horizontal,
                            child: const RightColumn())),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => const Text('error'),
      loading: () => const SizedBox.shrink(),
    );
  }
}
