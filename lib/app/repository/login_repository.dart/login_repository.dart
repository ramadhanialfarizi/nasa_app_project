class LoginRepository {
  static LoginRepository? _instance;

  LoginRepository._internal() {
    _instance = this;
  }

  factory LoginRepository() => _instance ?? LoginRepository._internal();
}
