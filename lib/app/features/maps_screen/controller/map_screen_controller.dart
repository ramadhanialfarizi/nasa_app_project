import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MapScreenController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  CameraPosition? cameraGooglePlex;

  getUserPosition() async {
    final GoogleMapController controller = await mapController.future;

    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      var userPosition = await Geolocator.getCurrentPosition();

      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              (userPosition.latitude) - 0.0001,
              userPosition.longitude,
            ),
            zoom: 15.0,
          ),
        ),
      );
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
