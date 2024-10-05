import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nasa_project/app/repository/market_repository/market_repository.dart';
import 'package:nasa_project/app/repository/market_repository/request/market_request.dart';
import 'package:nasa_project/app/repository/market_repository/response/market_response.dart';
import 'package:nasa_project/services/api_services/model/parent_response.dart';

class MarketScreenController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<MarketResponse> marketResponseData = MarketResponse().obs;

  @override
  void onInit() {
    getListPlants();
    super.onInit();
  }

  getListPlants() async {
    isLoading.value = true;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);

    MarketRequest param = MarketRequest();
    param.date = formattedDate;

    ParentResponse response = await MarketRepository().getListPlants(param);

    isLoading.value = false;
    if (response.isError != null) {
      marketResponseData.value = response.data;
    }
  }
}
