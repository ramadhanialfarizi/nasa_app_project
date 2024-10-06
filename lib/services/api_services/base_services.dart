import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:nasa_project/app/core/utils/log_utility.dart';

class BaseServices {
  final Dio _dio = Dio();

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  String path = "";
  String token = "";
  Map<String, String>? headers;

  initBaseServices() async {
    headers = {
      'Content-Type': 'application/json',
      'User-Agent': "PostmanRuntime/7.41.2",
      'Accept': "*/*",
      'Accept-Encoding': "gzip, deflate, br",
      'Connection': "keep-alive",
    };

    LogUtility.writeLog("Header : ${jsonEncode(headers)}");

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            return handler.resolve(Response(
              requestOptions: e.requestOptions,
              data: e.response?.data ??
                  {
                    "data": null,
                    "status": {
                      "code": 401,
                      "message": "Unauthorized access.",
                    },
                  },
              statusCode: 401,
            ));
          }
          if (e.response?.statusCode == 404) {
            return handler.resolve(Response(
              requestOptions: e.requestOptions,
              data: e.response?.data ??
                  {
                    "data": null,
                    "status": {
                      "code": 404,
                      "message": "not found",
                    },
                  },
              statusCode: 401,
            ));
          }
          return handler.next(e);
        },
      ),
    );
  }

  initEndpoint() async {
    // try {
    //   await _remoteConfig.fetchAndActivate();

    //   path = _remoteConfig.getString('urlAPI');
    //   LogUtility.writeLog("path : $path");
    // } catch (e) {
    //   LogUtility.writeLog('Failed to fetch remote config: $e');
    // }
  }

  Future<Response> postApi<T>(
      {required Map<String, dynamic> params, required String endpoint}) async {
    await initBaseServices();
    await initEndpoint();

    LogUtility.writeLog("$path$endpoint Request : ${jsonEncode(params)}");

    try {
      var response = await Dio().post(
        "$path$endpoint",
        data: params,
        options: Options(
          headers: headers,
        ),
      );

      LogUtility.writeLog(
          "$path$endpoint Response : ${jsonEncode(response.data)}");

      return response;
    } on DioException catch (e) {
      LogUtility.writeLog(
          "$path$endpoint Response : ${jsonEncode(e.response)}");

      LogUtility.writeLog("Dio Error : $e");
      return e.response!;
    } catch (e) {
      LogUtility.writeLog("$path$endpoint Response : $e");
      rethrow;
    }
  }
}
