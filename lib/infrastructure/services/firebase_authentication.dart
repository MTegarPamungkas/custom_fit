// ignore_for_file: avoid_print

import 'package:custom_fit/domain/entities/user.dart' as app_user;
import 'package:custom_fit/domain/value_objects/email.dart';
import 'package:custom_fit/domain/value_objects/password.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<app_user.User?> loginWithEmailPassword(
      Email email, Password password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      return app_user.User(
          uid: userCredential.user!.uid,
          email: Email(userCredential.user!
              .email!) // You might need to retrieve the actual password from a secure source
          );
    } catch (e) {
      print("Error logging in with email and password: $e");
      return null;
    }
  }

  Future<app_user.User?> registerWithEmailPassword(
      Email email, Password password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      return app_user.User(
          uid: userCredential.user!.uid,
          email: Email(userCredential.user!
              .email!) // You might need to retrieve the actual password from a secure source
          );
    } catch (e) {
      print("Error register in with email and password: $e");
      return null;
    }
  }
}
