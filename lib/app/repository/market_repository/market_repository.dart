import 'package:nasa_project/app/repository/market_repository/response/market_response.dart';

class MarketRepository {
  static MarketRepository? _instance;

  MarketRepository._internal() {
    _instance = this;
  }

  factory MarketRepository() => _instance ?? MarketRepository._internal();

  Future<MarketResponse> getListPlants() async {
    return MarketResponse();
  }
}
