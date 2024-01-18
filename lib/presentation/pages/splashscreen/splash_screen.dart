import 'package:custom_fit/presentation/app.dart';
import 'package:custom_fit/presentation/pages/onboarding/onboarding_one.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _checkPref() async {
    final box = GetStorage();
    final emailString = box.read('userEmail');

    if (emailString != null) {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => App(),
            ),
          );
        },
      );
    } else {
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
    }
  }

  @override
  void initState() {
    super.initState();
    _checkPref();
  }

  @override
  Widget build(BuildContext context) {
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
