import 'package:get/get.dart';
import 'package:nasa_project/app/repository/market_repository/market_repository.dart';
import 'package:nasa_project/app/repository/market_repository/request/market_detail_request.dart';
import 'package:nasa_project/app/repository/market_repository/response/market_detail_response.dart';
import 'package:nasa_project/app/repository/market_repository/response/plant_list_response.dart';
import 'package:nasa_project/services/api_services/model/parent_response.dart';

class MarketDetailScreenController extends GetxController {
  final PlantListResponse plantListResponse;
  RxBool isLoading = false.obs;

  Rx<MarketDetailResponse> marketResponseData = MarketDetailResponse().obs;

  MarketDetailScreenController({
    required this.plantListResponse,
  });

  @override
  void onInit() {
    getDetailMarket();
    super.onInit();
  }

  getDetailMarket() async {
    isLoading.value = true;

    MarketDetailRequest param = MarketDetailRequest();
    param.id = plantListResponse.id;

    ParentResponse response = await MarketRepository().getDetailMarket(param);

    isLoading.value = false;
    if (response.isError != true) {
      marketResponseData.value = response.data;
    }
  }

  onBackTap() {
    Get.back();
  }
}
