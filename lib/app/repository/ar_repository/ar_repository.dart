import 'package:nasa_project/app/core/utils/log_utility.dart';
import 'package:nasa_project/app/repository/ar_repository/dummy/ar_dummy.dart';
import 'package:nasa_project/app/repository/ar_repository/request/scan_request.dart';
import 'package:nasa_project/app/repository/ar_repository/response/scan_response.dart';
import 'package:nasa_project/services/api_services/model/parent_response.dart';

class ArRepository {
  static ArRepository? _instance;

  factory ArRepository() => _instance ?? ArRepository._internal();

  ArRepository._internal() {
    _instance = this;
  }

  Future<ParentResponse> getScan(ScanRequest param) async {
    try {
      ParentResponse response = ParentResponse.fromJson(ArDummy().scanResponse);

      if (response.data != null) {
        ScanResponse data = ScanResponse.fromJson(response.data);

        response.data = data;
        return response;
      } else {
        return response;
      }
    } catch (e) {
      LogUtility.writeLog("error scan repo: $e");
      return ParentResponse();
    }
  }
}
