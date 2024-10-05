import 'dart:async';
import 'dart:convert';

import 'package:flutter_package/flutter_package.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nasa_project/app/repository/map_repository/map_repository.dart';
import 'package:nasa_project/app/repository/map_repository/request/map_request.dart';
import 'package:nasa_project/app/repository/map_repository/response/map_response.dart';
import 'package:nasa_project/services/api_services/model/parent_response.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Marker> markerData = <Marker>[].obs;

  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  CameraPosition? cameraGooglePlex;

  Rx<MapResponse> mapResponse = MapResponse().obs;

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

      getPlantsLocation(
        latitude: userPosition.latitude,
        longitude: userPosition.longitude,
      );
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  getPlantsLocation(
      {required double latitude, required double longitude}) async {
    isLoading.value = true;

    MapRequest params = MapRequest();
    params.lat = latitude.toString();
    params.long = longitude.toString();

    ParentResponse response = await MapRepository().getAllPlantsLocaion(params);

    isLoading.value = false;
    if (response.isError != true) {
      mapResponse.value = response.data;

      mapResponse.value.values?.forEach(
        (element) {
          final lat = double.parse(element.lat ?? "0");
          final long = double.parse(element.long ?? "0");
          final plant = element.plants;
          final code = element.code;

          markerData.add(
            Marker(
              markerId: MarkerId(code ?? "0"),
              position: LatLng(lat, long),
              infoWindow: InfoWindow(
                title: "Recommendation plant to grow in your Soil is",
                snippet: "$plant",
              ),
            ),
          );
        },
      );

      LogUtility.writeLog("data : ${jsonEncode(mapResponse.value)}");
    }
  }
}
