import 'package:flutter/material.dart';
import 'ui/login/login.dart';
import 'ui/splash_screen/splash_screen.dart';

class SpashDuration extends StatelessWidget {
  const SpashDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 4)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
