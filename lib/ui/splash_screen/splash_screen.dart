import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controllerLoading =
      AnimationController(duration: const Duration(seconds: 2), vsync: this);

  late final Animation<AlignmentGeometry> animationLoading =
      Tween<AlignmentGeometry>(
              begin: Alignment.centerLeft, end: Alignment.center)
          .animate(
    CurvedAnimation(parent: controllerLoading, curve: Curves.linear),
  );
  late final Animation<AlignmentGeometry> animationLoading2 =
      Tween<AlignmentGeometry>(
              begin: Alignment.bottomRight, end: Alignment.center)
          .animate(
    CurvedAnimation(parent: controllerLoading, curve: Curves.linear),
  );

  @override
  void initState() {
    controllerLoading.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: size.height * 0.47,
          left: -60,
          right: -290,
          child: AlignTransition(
            alignment: animationLoading,
            child: SizedBox(
              width: size.width * 0.80,
              height: size.height * 0.23,
              child:const Text(
                "Bem",
                style: TextStyle(
                  fontSize: 45.0, // Tamanho da fonte aumentado para 20.0
                  fontWeight: FontWeight.bold, // Negrito
                  // Cor do texto
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.53,
          left: 15,
          right: -290,
          child: AlignTransition(
            alignment: animationLoading2,
            child: SizedBox(
              width: size.width * 0.70,
              height: size.height * 0.30,
              child: const Text(
                "Vindo",
                style: TextStyle(
                  fontSize: 20.0, // Tamanho da fonte aumentado para 20.0
                  fontWeight: FontWeight.bold, // Negrito
                  // Cor do texto
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: size.height * 0.37,
            left: size.width * 0.015,
            right: size.width * 0.015,
            child: SizedBox(
              width: size.width * 0.40,
              height: size.height * 0.30,
              child: Image.asset('assets/splash/splash_1.png'),
            )),
      ]),
    );
  }
}
