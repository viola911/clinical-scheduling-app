import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:scheduling_app/constants.dart';
import 'package:scheduling_app/intro.dart';

import '../logch.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Expanded(
        child: ListView(
          children: [
            Image.asset('assets/images/logo.jpg'),
            const Text('  Mind Khan '),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 83, 166, 180),
      nextScreen: const Logch(),
      splashIconSize: 800,
      duration: 1000,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Duration(seconds: 2),
      pageTransitionType: PageTransitionType.scale,
    );
  }
}
