import 'package:custom_fit/domain/value_objects/email.dart';

class User {
  final String uid;
  final Email email;

  User({
    required this.uid,
    required this.email,
  });
}
