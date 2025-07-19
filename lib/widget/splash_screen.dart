import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reads/constants/colors.dart';
import '../home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backWhite,
      body: Lottie.asset(
        'lib/assets/reads_splash_final.json',
        width: MediaQuery.of(context).size.width * 1.2,
        fit: BoxFit.cover,
        onLoaded: (composition) {
          Future.delayed(const Duration(seconds: 2), () {
            if (!mounted) return;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          });
        },
      ),
    );
  }

}