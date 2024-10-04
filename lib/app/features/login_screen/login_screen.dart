import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/core/global_widget/default_loading_screen.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/core/utils/image_utils.dart';
import 'package:nasa_project/app/features/login_screen/controller/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(LoginScreenController());
    return BaseWidgetContainer(
      body: Stack(
        children: [
          SizedBox(
            width: ConstantUtils.getFullWidth(context),
            height: ConstantUtils.getFullHeight(context),
            child: Image.asset(
              ImageUtils.authBackground,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: ConstantUtils.getFullHeight(context) * 0.25,
            child: Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi There',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 36,
                      color: ColorUtils.whiteColors,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: ConstantUtils.getFullWidth(context),
                    child: Text(
                      'Welcome to Check-Your-Soil App\nPlease login to proceed using the feature',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: ColorUtils.whiteColors,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: ConstantUtils.getFullWidth(context),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        ImageUtils.googleIcons,
                        height: 36,
                        width: 36,
                      ),
                      label: const Text(
                        'Login with Google',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => _controller.isLoadingLogin.value
                ? const DefaultLoadingScreenProject()
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
