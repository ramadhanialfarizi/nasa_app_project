import 'package:flutter_package/flutter_package.dart';
import 'package:nasa_project/app/repository/map_repository/dummy/map_dummy.dart';
import 'package:nasa_project/app/repository/map_repository/request/map_request.dart';
import 'package:nasa_project/app/repository/map_repository/response/map_response.dart';
import 'package:nasa_project/services/api_services/model/parent_response.dart';

class MapRepository {
  static MapRepository? _instance;

  MapRepository._internal() {
    _instance = this;
  }

  factory MapRepository() => _instance ?? MapRepository._internal();

  Future<ParentResponse> getAllPlantsLocaion(MapRequest params) async {
    try {
      ParentResponse response = ParentResponse.fromJson(MapDummy.dummyLocation);

      if (response.data != null) {
        MapResponse mapResponse = MapResponse.fromJson(response.data);

        response.data = mapResponse;
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
