import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nasa_project/app/features/maps_screen/controller/map_screen_controller.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(MapScreenController());
    return BaseWidgetContainer(
        actvateScroll: false,
        body: Obx(
          () => GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _controller.cameraGooglePlex ??
                const CameraPosition(
                  target: LatLng(-6.176766422291668, 106.84238696701179),
                  zoom: 10,
                ),
            onMapCreated: (GoogleMapController controller) {
              _controller.mapController.complete(controller);
              _controller.getUserPosition();
            },
            markers: Set<Marker>.of(_controller.markerData),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
        ));
  }
}
