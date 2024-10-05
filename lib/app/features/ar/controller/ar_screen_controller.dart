import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/features/ar/annotation.dart';

class ArScreenController extends GetxController {
  RxBool isLoadingLogin = false.obs;

  RxList<Annotation> annotations = fakeAnnotation(
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
          numberMaxPoi: 50)
      .obs;
}
