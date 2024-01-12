import 'package:custom_fit/presentation/pages/onboarding/onboarding_one.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const OnboardingOne(),
          ),
        );
      },
    );

    return Scaffold(
      backgroundColor: const Color(0xFF5D55B3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/logo.png",
              width: 150,
            ),
            const Text(
              'CustomFit  ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
