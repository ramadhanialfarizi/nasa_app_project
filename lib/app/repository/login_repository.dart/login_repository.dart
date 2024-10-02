import 'package:nasa_project/app/repository/login_repository.dart/response/login_response.dart';
import 'package:nasa_project/services/firebase_services/auth/auth_service.dart';

class LoginRepository {
  static LoginRepository? _instance;

  LoginRepository._internal() {
    _instance = this;
  }

  factory LoginRepository() => _instance ?? LoginRepository._internal();

  Future<LoginResponse> loginWithGoogle() async {
    LoginResponse loginResponse = LoginResponse();
    try {
      var authData = await AuthService().signInWithGoogle();

      if (authData != null) {
        loginResponse.errorMessage = "";
        loginResponse.isError = false;
        loginResponse.userData = authData;
      } else {
        loginResponse.errorMessage = "login failed";
        loginResponse.isError = true;
      }

      return loginResponse;
    } catch (e) {
      loginResponse.errorMessage = e.toString();
      loginResponse.isError = true;

      return loginResponse;
    }
  }
}
