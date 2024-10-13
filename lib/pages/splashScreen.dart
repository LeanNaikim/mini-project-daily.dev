import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:mini_project/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null ;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Center(
          // child: LottieBuilder.asset("assets/Lottie/Animation - 1728357012961.json"),
          child: Image.asset("assets/images/logo2.webp"),
        ),
        nextScreen: const MyHomePage(title: ''),
        splashIconSize: 200,
        // backgroundColor: const Color.fromARGB(255, 255, 204, 0),
    );
  }
}