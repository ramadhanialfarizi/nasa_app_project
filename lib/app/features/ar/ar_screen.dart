import 'dart:async';

import 'package:ar_location_view/ar_location_view.dart' hide ArView;
import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart' hide LogUtility;
import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/features/ar/ar_view.dart';
import 'package:nasa_project/app/features/ar/components/ParametersCard.dart';
import 'package:nasa_project/app/features/ar/controller/ar_screen_controller.dart';

class ArScreen extends StatelessWidget {
  const ArScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArScreenController());
    controller.scans;
    return BaseWidgetContainer(
      canPop: false,
      onPopInvoked: (p0) {
        controller.handleBack();
        return true;
      },
      body: InkWell(
        onTap: () {
          controller.showCard.value = false;
        },
        child: Stack(children: [
          Obx(
            () => ArLocationWidget(
              annotations: controller.annotations.value,
              showDebugInfoSensor: false,
              showRadar: true,
              radarPosition: RadarPosition.topRight,
              backgroundRadar: ColorUtils.primaryColors,
              annotationHeight: 340,
              annotationWidth: 339,
              annotationViewBuilder: (context, annotation) {
                return ArView(
                  key: ValueKey(annotation.uid),
                  annotation: annotation,
                );
              },
              onLocationChange: (position) {
                Future.delayed(Durations.extralong1, () {
                  controller.currentPosition.value = position;
                });
              },
            ),
          ),
          Obx(
            () => controller.isLoadingScan.isFalse
                ? const SizedBox.shrink()
                : Center(
                    child: AnimatedContainer(
                    duration: Durations.extralong4,
                    padding: const EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorUtils.primaryColors.withOpacity(0.5),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius:
                                controller.isDarkLoading.isTrue ? 50 : 0,
                            blurRadius:
                                controller.isDarkLoading.isTrue ? 50 : 0,
                            color: ColorUtils.whiteColors.withOpacity(0.5))
                      ],
                    ),
                    child: Icon(Icons.qr_code_scanner_outlined,
                        size: 150, color: ColorUtils.whiteColors),
                  )),
          ),
          Obx(
            () => controller.showCard.isTrue
                ? Center(
                    child: SizedBox(
                        height: 340,
                        width: 340,
                        child: ParametersCard(
                          annotation: controller.selectedAnnotation.value,
                        )))
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: Obx(
                      () => InkWell(
                        onTap: () {
                          if (controller.isLoadingScan.isFalse) {
                            if (controller.currentPosition.value.longitude ==
                                    0.0 ||
                                controller.currentPosition.value.latitude ==
                                    0.0) {
                              Timer.periodic(Durations.extralong1, (timer) {
                                timer.cancel();
                                controller.onScan();
                              });
                            } else {
                              controller.onScan();
                            }
                          }
                        },
                        child: AnimatedContainer(
                          duration: Durations.extralong4,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorUtils.primaryColors.withOpacity(
                                controller.isLoadingScan.isTrue ? 0.2 : 1),
                            border: Border.all(
                                width: 5,
                                color: ColorUtils.whiteColors.withOpacity(0.5)),
                          ),
                          child: const Icon(
                            Icons.qr_code_scanner_outlined,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          InkWell(
              onTap: () {
                controller.handleBack();
              },
              child: Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(top: 40, left: 20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color:
                              ColorUtils.chartSecondaryColors.withOpacity(0.6),
                          blurRadius: 3)
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(65)),
                    border: Border.all(
                        width: 2,
                        color:
                            ColorUtils.chartSecondaryColors.withOpacity(0.5))),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: ColorUtils.whiteColors,
                  size: 20,
                ),
              )),
        ]),
      ),
    );
  }
}
