import 'package:nasa_project/app/repository/data_model/soil_dm.dart';
import 'package:nasa_project/app/repository/home_repository/response/soil_response.dart';
import 'package:nasa_project/services/api_services/base_services.dart';
import 'package:nasa_project/services/api_services/endpoints.dart';
import 'package:nasa_project/services/api_services/model/parent_response.dart';

class HomeRepository extends BaseServices {
  static HomeRepository? _instance;

  factory HomeRepository() => _instance ?? HomeRepository._internal();

  HomeRepository._internal() {
    _instance = this;
  }

  Future<ParentResponse> getListSoilInfos() async {
    ParentResponse? response = await postApi(
      params: {"": ""},
      endpoint: Endpoints.getActiveJob,
    ) as ParentResponse;
    try {
      if (response.isError != true) {
        List<SoilDM> dataDM = [];
        if ((response.data ?? []).isNotEmpty) {
          response.data.forEach((item) {
            SoilResponse soil = SoilResponse.fromJson(item);
            SoilDM soilDM = SoilDM();
            soilDM.id = soil.id;
            soilDM.latitude = soil.Latitude;
            soilDM.longitude = soil.Longitude;
            soilDM.precipitation = soil.Precipitation;
            soilDM.predictionRF = soil.Prediction_RF;
            soilDM.predictionSR = soil.Prediction_SR;
            soilDM.predictionSW = soil.Prediction_SW;
            soilDM.predictionTemp = soil.Prediction_Temp;
            soilDM.soilWater = soil.Soil_Water;
            soilDM.solarRadiation = soil.Solar_Radiation;
            soilDM.temperature = soil.Temperature;
            soilDM.thresholdPoints = soil.Threshold_Points;
            dataDM.add(soilDM);
          });
          response.data = dataDM;
        }
      }
      return response;
    } catch (e) {
      response.message = e.toString();
      response.isError = true;

      return response;
    }
  }
}
