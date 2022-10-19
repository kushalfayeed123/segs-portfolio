import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
            child: ScaleTransition(
              scale: _animation,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.2, 0.35),
                    child: Lottie.asset('assets/animations/loader.json',
                        height: 50, width: 50, animate: animate),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
