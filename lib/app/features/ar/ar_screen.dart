import 'package:ar_location_view/ar_location_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/log_utility.dart';
import 'package:nasa_project/app/features/ar/annotation.dart';
import 'package:nasa_project/app/features/ar/ar_view.dart';
import 'package:nasa_project/app/features/ar/controller/ar_screen_controller.dart';

class ArScreen extends StatelessWidget {
  const ArScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArScreenController());
    return ArLocationWidget(
      annotations: controller.annotations,
      showDebugInfoSensor: true,
      annotationViewBuilder: (context, annotation) {
        var annotations = controller.annotations;
        LogUtility.writeLog(annotations);
        return ArView(
          key: ValueKey(annotation.uid),
          annotation: annotation as Annotation,
        );
      },
      onLocationChange: (position) {
        Future.delayed(const Duration(seconds: 5), () {
          controller.annotations.value =
              fakeAnnotation(position: position, numberMaxPoi: 50);
        });
      },
    );
  }
}
