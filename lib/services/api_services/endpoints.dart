class Endpoints {
  static Endpoints? _instance;

  Endpoints._internal() {
    _instance = this;
  }

  factory Endpoints() => _instance ?? Endpoints._internal();

  static const String getActiveJob = "/getActiveJob";
}
