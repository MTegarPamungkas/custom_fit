import 'package:custom_fit/domain/entities/user.dart' as app_user;
import 'package:custom_fit/domain/value_objects/email.dart';
import 'package:custom_fit/domain/value_objects/password.dart';

abstract class UserRepository {
  Future<app_user.User?> login(Email email, Password password);
  Future<app_user.User?> register(Email email, Password password);
}
