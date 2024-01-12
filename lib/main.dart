import 'package:custom_fit/presentation/pages/customfit/custom_fit.dart';
import 'package:custom_fit/presentation/pages/customfit/result.dart';
import 'package:custom_fit/presentation/pages/payment/checkout_page.dart';
import 'package:custom_fit/presentation/pages/payment/payment_success.dart';
import 'package:custom_fit/presentation/pages/splashscreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
