import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/log_utility.dart';
import 'package:nasa_project/app/features/ar/annotation.dart';
import 'package:nasa_project/app/features/main_screen/controller/main_screen_controller.dart';
import 'package:nasa_project/app/repository/ar_repository/ar_repository.dart';
import 'package:nasa_project/app/repository/ar_repository/request/scan_request.dart';
import 'package:nasa_project/app/repository/data_model/soil_dm.dart';
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
  ).obs;
  RxBool showCard = false.obs;
  RxList<Annotation> annotations = <Annotation>[].obs;

  CollectionReference scans =
      FirebaseFirestore.instance.collection('scanHistory');

  final navbarController = Get.put(MainScreenController());

  handleBack() {
    if (showCard.isTrue) {
      showCard.value = false;
    } else {
      navbarController.selectedWidget.value = 0;
      Get.delete<ArScreenController>();
      Get.off(() => MainScreenController());
    }
  }

  @override
  void onInit() {
    scans.get().then((snapshot) {
      List<Annotation> newAnnotations = [];
      if (snapshot.docs.isNotEmpty) {
        for (var doc in snapshot.docs) {
          try {
            // Position position = Position(
            //     longitude: doc['longitude'] ?? 0,
            //     latitude: doc['latitude'] ?? 0,
            //     timestamp:
            //         DateTime.tryParse(doc['timestamp']) ?? DateTime.now(),
            //     accuracy: doc['accuracy'] ?? 0,
            //     altitude: doc['altitude'] ?? 0,
            //     altitudeAccuracy: doc['altitudeAccuracy'] ?? 0,
            //     heading: doc['heading'] ?? 0,
            //     headingAccuracy: doc['headingAccuracy'] ?? 0,
            //     speed: doc['speed'] ?? 0,
            //     speedAccuracy: doc['speedAccuracy'] ?? 0);
            // SoilDM soilDM = doc as SoilDM;
            // Annotation annotation = Annotation(
            //     uid: doc.id,
            //     position: soilDM.position ?? position,
            //     soilDM: doc as SoilDM);
            newAnnotations.add(doc as Annotation);
          } catch (e) {
            LogUtility.writeLog('error stream: ${e.toString()}');
          }
        }
      }
      if (newAnnotations.isNotEmpty) {
        annotations.clear();
        annotations.value = newAnnotations;
      }
    });
    super.onInit();
  }

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
    try {
      ScanRequest param = ScanRequest();
      param.latitude = currentPosition.value.latitude;
      param.longitude = currentPosition.value.longitude;
      param.timestamp = DateTime.now().toString();
      LogUtility.writeLog("param scan: ${param.toJson()}");
      ParentResponse response = await ArRepository().getScan(param);
      if (response.isError != true) {
        SoilDM scanRes = response.data;
        selectedAnnotation.value.position = currentPosition.value;
        selectedAnnotation.value.soilDM = scanRes;
        // LogUtility.writeLog({
        //   "latitude": param.latitude,
        //   "longitude": param.longitude,
        //   "timestamp": param.timestamp,
        //   "accuracy": currentPosition.value.accuracy,
        //   "altitude": currentPosition.value.altitude,
        //   "altitudeAccuracy": currentPosition.value.altitudeAccuracy,
        //   "heading": currentPosition.value.heading,
        //   "headingAccuracy": currentPosition.value.headingAccuracy,
        //   "speed": currentPosition.value.speed,
        //   "speedAccuracy": currentPosition.value.speedAccuracy,
        //   "PSI": scanRes.PSI,
        //   "TOP_5": scanRes.TOP_5,
        // });
        annotations.add(selectedAnnotation.value);
        //   {
        //   "latitude": param.latitude,
        //   "longitude": param.longitude,
        //   "timestamp": param.timestamp,
        //   "PSI": scanRes.PSI,
        //   "TOP_5": scanRes.TOP_5,
        //   "accuracy": currentPosition.value.accuracy,
        //   "altitude": currentPosition.value.altitude,
        //   "altitudeAccuracy": currentPosition.value.altitudeAccuracy,
        //   "heading": currentPosition.value.heading,
        //   "headingAccuracy": currentPosition.value.headingAccuracy,
        //   "speed": currentPosition.value.speed,
        //   "speedAccuracy": currentPosition.value.speedAccuracy,
        // }
        scans.add(selectedAnnotation.value).then((value) {
          LogUtility.writeLog("Scan requested");
        }).catchError((error) {
          LogUtility.writeLog("Failed to scan: $error");
        });
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
