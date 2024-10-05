import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/log_utility.dart';
import 'package:nasa_project/app/features/ar/annotation.dart';
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

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference scans = FirebaseFirestore.instance.collection('scans');

  Future<void> onScan() async {
    isLoadingScan.value = true;
    timerAnimate.cancel();
    timerAnimate = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (isLoadingScan.value = true) {
        isDarkLoading.value = !isDarkLoading.value;
      } else {
        timer.cancel();
      }
    });
    try {
      await scans
          .add(selectedAnnotation.value)
          .then((value) => LogUtility.writeLog("Scan requested"))
          .catchError((error) => LogUtility.writeLog("Failed to scan: $error"));
    } catch (e) {
      SnackBar(content: Text(e.toString()));
    }
    isLoadingScan.value = false;
  }
}
