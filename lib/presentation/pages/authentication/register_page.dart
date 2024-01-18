// ignore_for_file: avoid_print

import 'package:custom_fit/application/use_cases/authentication/register.dart';
import 'package:custom_fit/presentation/pages/authentication/login_page.dart';
import 'package:custom_fit/presentation/widgets/auth_button.dart';
import 'package:custom_fit/presentation/widgets/auth_google_button.dart';
import 'package:custom_fit/presentation/widgets/subtitle_text_auth.dart';
import 'package:custom_fit/presentation/widgets/title_text_auth.dart';
import 'package:custom_fit/presentation/widgets/username_text_field.dart';
import 'package:flutter/material.dart';
import 'package:custom_fit/domain/value_objects/email.dart';
import 'package:custom_fit/domain/value_objects/password.dart';
import 'package:custom_fit/infrastructure/services/firebase_authentication.dart';
import 'package:custom_fit/presentation/widgets/email_text_field.dart';
import 'package:custom_fit/presentation/widgets/password_text_field.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final FirebaseAuthenticationService _firebaseAuthService;
  late final RegisterUseCase _registerUseCase;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firebaseAuthService = FirebaseAuthenticationService();
    _registerUseCase = RegisterUseCase(_firebaseAuthService);
  }

  Future<void> _performRegister(BuildContext context) async {
    EasyLoading.show(status: 'Loading...');
    // final username = Email(_usernameController.text);
    final email = Email(_emailController.text);
    final password = Password(_passwordController.text);

    final user =
        await _registerUseCase.execute(email: email, password: password);

    if (user != null) {
      print('Register successful');
      EasyLoading.dismiss();
    } else {
      print('Register failed');
      EasyLoading.dismiss();
      // ignore: use_build_context_synchronously
      Alert(
        context: context,
        title: "Register failed",
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            width: 120,
            child: const Text(
              "Close",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
        style: const AlertStyle(overlayColor: Colors.black54),
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 32),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80.0),
                const TitleTextAuth(title: "Create your free account"),
                const SizedBox(height: 8.0),
                const SubTitleTextAuth(
                    title: "Do you already have an account?",
                    buttonText: "Sign In",
                    onPressed: LoginPage()),
                const SizedBox(height: 40.0),
                UsernameTextField(controller: _usernameController),
                const SizedBox(height: 20.0),
                EmailTextField(controller: _emailController),
                const SizedBox(height: 20.0),
                PasswordTextField(controller: _passwordController),
                const SizedBox(height: 40.0),
                AuthButton(
                    title: "Sign Up",
                    onPressed: () => _performRegister(context)),
                const SizedBox(height: 10.0),
                AuthGoogleButton(
                    onPressed: () => _performRegister(context),
                    title: "Sign up with Google"),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
