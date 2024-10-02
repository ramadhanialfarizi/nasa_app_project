import 'package:firebase_auth/firebase_auth.dart';

class LoginResponse {
  UserCredential? userData;
  bool? isError;
  String? errorMessage;

  LoginResponse({
    this.errorMessage,
    this.isError,
    this.userData,
  });
}
