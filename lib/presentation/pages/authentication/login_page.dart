// ignore_for_file: avoid_print

import 'package:custom_fit/application/use_cases/authentication/login.dart';
import 'package:custom_fit/presentation/pages/home/home_page.dart';
import 'package:custom_fit/presentation/widgets/auth_button.dart';
import 'package:custom_fit/presentation/widgets/auth_google_button.dart';
import 'package:custom_fit/presentation/widgets/subtitle_text_auth.dart';
import 'package:custom_fit/presentation/widgets/title_text_auth.dart';
import 'package:flutter/material.dart';
import 'package:custom_fit/domain/value_objects/email.dart';
import 'package:custom_fit/domain/value_objects/password.dart';
import 'package:custom_fit/infrastructure/services/firebase_authentication.dart';
import 'package:custom_fit/presentation/widgets/email_text_field.dart';
import 'package:custom_fit/presentation/widgets/password_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final FirebaseAuthenticationService _firebaseAuthService;
  late final LoginUseCase _loginUseCase;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firebaseAuthService = FirebaseAuthenticationService();
    _loginUseCase = LoginUseCase(_firebaseAuthService);
  }

  Future<void> _performLogin(BuildContext context) async {
    final email = Email(_emailController.text);
    final password = Password(_passwordController.text);

    final user = await _loginUseCase.execute(email: email, password: password);

    if (user != null) {
      print('Login successful');
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      print('Login failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 24.0),
              const TitleTextAuth(title: "Welcome Back"),
              const SizedBox(height: 8.0),
              SubTitleTextAuth(
                  title: "Don't have an account?",
                  buttonText: "Sign Up",
                  onPressed: () => Navigator.pop(context)),
              const SizedBox(height: 40.0),
              EmailTextField(controller: _emailController),
              const SizedBox(height: 20.0),
              PasswordTextField(controller: _passwordController),
              const SizedBox(height: 40.0),
              AuthButton(
                  title: "Sign In", onPressed: () => _performLogin(context)),
              const SizedBox(height: 10.0),
              AuthGoogleButton(
                  onPressed: () => _performLogin(context),
                  title: "Sign in with Google"),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
