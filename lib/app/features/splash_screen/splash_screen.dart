import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/core/utils/image_utils.dart';
import 'package:nasa_project/app/features/splash_screen/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(SplashScreenController());
    return BaseWidgetContainer(
      backgroundColor: ColorUtils.backgroundScreenColors,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              ImageUtils.appIcons,
              width: 180,
              height: 180,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: ConstantUtils.getFullHeight(context) * 0.07,
              ),
              child: CircularProgressIndicator(
                color: ColorUtils.primaryColors,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
