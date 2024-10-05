import 'package:get/get.dart';
import 'package:nasa_project/app/repository/market_repository/response/market_detail_response.dart';

class MarketDetailScreenController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<MarketDetailResponse> marketResponseData = MarketDetailResponse().obs;

  @override
  void onInit() {
    // getListPlants();
    super.onInit();
  }

  onBackTap() {
    Get.back();
  }
}
