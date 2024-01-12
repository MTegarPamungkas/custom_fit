import 'package:custom_fit/domain/entities/user.dart' as app_user;
import 'package:custom_fit/domain/value_objects/email.dart';
import 'package:custom_fit/domain/value_objects/password.dart';
import 'package:custom_fit/infrastructure/services/firebase_authentication.dart';

class RegisterUseCase {
  final FirebaseAuthenticationService firebaseAuthService;

  RegisterUseCase(this.firebaseAuthService);

  Future<app_user.User?> execute({
    required Email email,
    required Password password,
  }) async {
    // Additional validation logic can be added here

    // Use Firebase authentication service to log in
    return firebaseAuthService.registerWithEmailPassword(email, password);
  }
}
