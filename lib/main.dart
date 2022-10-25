import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:segs/ui/shared/app_colors.dart';
import 'package:segs/ui/splash.dart';
import './ui/shared/routes.dart' as rt;
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Segs AJ',
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
          defaultScale: true),
      theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF10101a),
        scaffoldBackgroundColor: const Color(0xFF020c1b),
        primaryColor: const Color(0xFF8c52ff),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF020c1b),
            toolbarHeight: 110,
            elevation: 0,
            scrolledUnderElevation: 10.0),
        fontFamily: 'Hind',
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.bold,
              color: AppColors.offWhite),
          headline2: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: AppColors.offWhite),
          headline6: TextStyle(
              fontSize: 36.0,
              fontStyle: FontStyle.italic,
              color: AppColors.offWhite),
          bodyText2: TextStyle(fontSize: 14.0, color: AppColors.offWhite2),
        ),
      ),
      initialRoute: '/',
      routes: rt.routes,
      home: const Splash(),
    );
  }
}
