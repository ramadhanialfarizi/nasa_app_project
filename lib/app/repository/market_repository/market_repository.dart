import 'package:nasa_project/app/core/utils/log_utility.dart';
import 'package:nasa_project/app/repository/market_repository/dummy/market_dummy.dart';
import 'package:nasa_project/app/repository/market_repository/request/market_detail_request.dart';
import 'package:nasa_project/app/repository/market_repository/request/market_request.dart';
import 'package:nasa_project/app/repository/market_repository/response/market_detail_response.dart';
import 'package:nasa_project/app/repository/market_repository/response/market_response.dart';
import 'package:nasa_project/services/api_services/model/parent_response.dart';

class MarketRepository {
  static MarketRepository? _instance;

  MarketRepository._internal() {
    _instance = this;
  }

  factory MarketRepository() => _instance ?? MarketRepository._internal();

  Future<ParentResponse> getListPlants(MarketRequest param) async {
    try {
      ParentResponse response = ParentResponse.fromJson(MarketDummy.dummy);

      if (response.data != null) {
        MarketResponse marketResponse = MarketResponse.fromJson(response.data);

        response.data = marketResponse;
        return response;
      } else {
        return response;
      }
    } catch (e) {
      LogUtility.writeLog("error : $e");
      return ParentResponse();
    }
  }

  Future<ParentResponse> getDetailMarket(MarketDetailRequest param) async {
    try {
      ParentResponse response =
          ParentResponse.fromJson(MarketDummy.detailDummy);

      if (response.data != null) {
        MarketDetailResponse marketDetailResponse =
            MarketDetailResponse.fromJson(response.data);

        response.data = marketDetailResponse;
        return response;
      } else {
        return response;
      }
    } catch (e) {
      LogUtility.writeLog("error : $e");
      return ParentResponse();
    }
  }
}
