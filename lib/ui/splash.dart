import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:segs/ui/home/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _SplashState extends State<Splash> with TickerProviderStateMixin {
  bool animate = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        animate = true;
      });
    });
    Future.delayed(const Duration(seconds: 5),
        () => Navigator.pushNamed(context, Home.routename));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Stack(
              children: [
                ScaleTransition(
                  scale: _animation,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/logo2.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: _animation,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Lottie.asset('assets/animations/loader.json',
                        height: 70, width: 70, animate: animate),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
