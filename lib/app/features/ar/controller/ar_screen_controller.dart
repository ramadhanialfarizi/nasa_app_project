import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/log_utility.dart';
import 'package:nasa_project/app/features/ar/annotation.dart';
import 'package:nasa_project/app/repository/ar_repository/ar_repository.dart';
import 'package:nasa_project/app/repository/ar_repository/request/scan_request.dart';
import 'package:nasa_project/app/repository/ar_repository/response/scan_response.dart';
import 'package:nasa_project/services/api_services/model/parent_response.dart';
import 'package:uuid/uuid.dart';

class ArScreenController extends GetxController {
  RxBool isLoadingScan = false.obs;
  RxBool isDarkLoading = false.obs;
  Timer timerAnimate = Timer(Duration.zero, () {});
  Rx<Position> currentPosition = Position(
          longitude: 0,
          latitude: 0,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          altitudeAccuracy: 0,
          heading: 0,
          headingAccuracy: 0,
          speed: 0,
          speedAccuracy: 0)
      .obs;
  Rx<Annotation> selectedAnnotation = Annotation(
          uid: const Uuid().v1(),
          position: Position(
              longitude: 0,
              latitude: 0,
              timestamp: DateTime.now(),
              accuracy: 0,
              altitude: 0,
              altitudeAccuracy: 0,
              heading: 0,
              headingAccuracy: 0,
              speed: 0,
              speedAccuracy: 0),
          type: AnnotationType.good)
      .obs;
  RxList<Annotation> annotations = <Annotation>[].obs;
  RxBool showCard = false.obs;

  CollectionReference scans = FirebaseFirestore.instance.collection('scans');

  Future<void> onScan() async {
    isLoadingScan.value = true;
    timerAnimate.cancel();
    timerAnimate = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (isLoadingScan.value == true) {
        isDarkLoading.value = !isDarkLoading.value;
      } else {
        timer.cancel();
      }
    });
    selectedAnnotation.value.position = currentPosition.value;
    try {
      ScanRequest param = ScanRequest();
      param.latitude = currentPosition.value.latitude;
      param.longitude = currentPosition.value.longitude;
      param.timestamp = DateTime.now().toString();
      LogUtility.writeLog("param scan: ${param.toJson()}");
      ParentResponse response = await ArRepository().getScan(param);
      if (response.isError != true) {
        ScanResponse scanRes = response.data;
        LogUtility.writeLog({
          "latitude": param.latitude,
          "longitude": param.longitude,
          "timestamp": param.timestamp,
          "PSI": scanRes.PSI,
          "TOP_5": scanRes.TOP_5,
        });
        await scans.add({
          "latitude": param.latitude,
          "longitude": param.longitude,
          "timestamp": param.timestamp,
          ...scanRes.toJson()
        }).then((value) {
          LogUtility.writeLog("Scan requested");
          annotations.add(selectedAnnotation.value);
        }).catchError((error) => LogUtility.writeLog("Failed to scan: $error"));
      } else {
        LogUtility.writeLog(response.message);
      }
    } catch (e) {
      LogUtility.writeLog(e.toString());
    }
    timerAnimate.cancel();
    isLoadingScan.value = false;
    showCard.value = true;
    LogUtility.writeLog('shabi: ${isLoadingScan.value}');
  }
}
