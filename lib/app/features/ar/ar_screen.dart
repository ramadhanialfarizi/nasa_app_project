import 'package:ar_location_view/ar_location_view.dart' hide ArView;
import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart' hide LogUtility;
import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/core/utils/log_utility.dart';
import 'package:nasa_project/app/features/ar/ar_view.dart';
import 'package:nasa_project/app/features/ar/controller/ar_screen_controller.dart';
import 'package:nasa_project/app/features/main_screen/controller/main_screen_controller.dart';

class ArScreen extends StatelessWidget {
  const ArScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArScreenController());
    final navbarController = Get.put(MainScreenController());
    return BaseWidgetContainer(
      canPop: false,
      onPopInvoked: (p0) {
        navbarController.selectedWidget.value = 0;
        controller.timerAnimate.cancel();
        Get.to(() => MainScreenController());
        return true;
      },
      body: Stack(children: [
        Obx(() => controller.annotations.isEmpty
            ? ArLocationWidget(
                annotations: controller.annotations,
                showDebugInfoSensor: false,
                showRadar: false,
                annotationHeight: 198,
                annotationViewBuilder: (context, annotation) {
                  var annotations = controller.annotations;
                  return ArView(
                    key: ValueKey(annotation.uid),
                  );
                },
                onLocationChange: (position) {
                  Future.delayed(const Duration(seconds: 5), () {
                    controller.currentPosition.value = position;
                  });
                },
              )
            : ArCamera(onCameraError: (error) {
                LogUtility.writeLog('camera error: $error');
              }, onCameraSuccess: () {
                LogUtility.writeLog('camera success');
              })),
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
                          blurRadius: controller.isDarkLoading.isTrue ? 50 : 0,
                          color: ColorUtils.whiteColors.withOpacity(0.5))
                    ],
                  ),
                  child: Icon(Icons.qr_code_scanner_outlined,
                      size: 150, color: ColorUtils.whiteColors),
                )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () {
              controller.onScan();
            },
            child: AnimatedContainer(
              duration: Durations.extralong4,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorUtils.primaryColors,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: controller.isDarkLoading.isTrue ? 50 : 0,
                      blurRadius: controller.isDarkLoading.isTrue ? 50 : 0,
                      color: ColorUtils.whiteColors.withOpacity(0.5))
                ],
                border: Border.all(
                    width: 5, color: ColorUtils.whiteColors.withOpacity(0.5)),
              ),
              child: const Icon(
                Icons.qr_code_scanner_outlined,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
