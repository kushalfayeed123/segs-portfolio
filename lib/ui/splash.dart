import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segs/domain/core/app_data_provider.dart';
import 'package:segs/ui/home/home.dart';
import 'package:uuid/uuid.dart';

import '../models/projects.dart';
import '../models/user.model.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class SplashState extends ConsumerState<Splash> with TickerProviderStateMixin {
  bool animate = false;
  bool _visible = true;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutBack,
  );

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    List<Projects> projects = [];

    final project1 = Projects(
        id: const Uuid().v4(),
        title: '247Cash',
        description: 'A long description',
        status: 'Active',
        stack: 'Flutter, Dart, Node Js, Firebase, Heroku',
        imgUrl: '',
        appUrl: '',
        webUrl: '',
        type: 'mobile');
    final project2 = Projects(
        id: const Uuid().v4(),
        title: 'Be Still',
        description: 'A long description',
        status: 'Active',
        stack: 'Flutter, Dart, Node Js, Firebase, Cloud Functions',
        imgUrl: '',
        appUrl: '',
        webUrl: '',
        type: 'mobile');
    projects.add(project1);
    projects.add(project2);
    final userPayload = UserModel(
        firstName: 'Segun',
        lastName: 'Ajanaku',
        introText: 'I build amazing applications',
        description: 'Some very long description',
        imgUrl: '',
        email: 'segunajanaku617@gmail.com',
        twitterUrl: '',
        instagramUrl: '',
        gitHubUrl: '',
        linkedInUrl: '',
        status: 'Active',
        activeTemplate: '',
        projects: projects);
    Future.delayed(const Duration(seconds: 4),
        () => Navigator.of(context).push(_createRoute()));
    Future.delayed(const Duration(milliseconds: 2700), () {
      setState(() {
        _visible = false;
      });
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      settings: const RouteSettings(name: Home.routename),
      transitionDuration: const Duration(seconds: 3),
      pageBuilder: (context, animation, secondaryAnimation) => const Home(
        widgetNumber: 1,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.ease;
        animation = CurvedAnimation(curve: curve, parent: animation);
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
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
                // Align(
                //   alignment: Alignment.center,
                //   child: Lottie.asset('assets/animations/logo.json',
                //       height: 350, width: 350),
                // ),
                ScaleTransition(
                  scale: _animation,
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/logo2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                // AnimatedOpacity(
                //   opacity: _visible ? 1.0 : 0.0,
                //   duration: const Duration(milliseconds: 500),

                //   // scale: _animation,
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: Image.asset(
                //       'assets/images/logo2.png',
                //       fit: BoxFit.contain,
                //     ),
                //   ),
                // ),
              ],
            ),
          )),
    );
  }
}
