import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:segs/ui/splash.dart';
import './ui/shared/routes.dart' as rt;

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
final helloWorldProvider = Provider((_) => 'Hello world');

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'My World',
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: const [
            ResponsiveBreakpoint.resize(350, name: MOBILE),
            ResponsiveBreakpoint.autoScale(600, name: TABLET),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1700, name: 'XL')
          ]),
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF10101a),
        scaffoldBackgroundColor: const Color(0xFF020c1b),
        primaryColor: const Color(0xFF8c52ff),

        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF020c1b),
            toolbarHeight: 110,
            elevation: 0,
            scrolledUnderElevation: 10.0),

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      initialRoute: '/',
      routes: rt.routes,
      home: const Splash(),
    );
  }
}
