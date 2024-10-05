import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nasa_project/app/core/utils/log_utility.dart';

class MapScreenController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  CameraPosition? cameraGooglePlex;

  // initializeMapController(GoogleMapController controller) {
  //   LogUtility.writeLog("MAP CONTROLLER INITALIZED");
  //   _controller = controller;
  //   getUserPosition();
  // }

  getUserPosition() {
    cameraGooglePlex = const CameraPosition(
      target: LatLng(-6.176766422291668, 106.84238696701179),
      zoom: 10,
    );
  }
}
