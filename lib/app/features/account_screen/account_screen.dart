import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/core/global_widget/default_loading_screen.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/core/utils/image_utils.dart';
import 'package:nasa_project/app/features/account_screen/controller/account_screen_controller.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(AccountScreenController());
    return Scaffold(
        body: Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          ImageUtils.farmerBackground,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ConstantUtils.getFullHeight(context) * 0.19,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Container(
                height: 137,
                width: 137,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      ImageUtils.userIcons,
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Darlene Robertson',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About this farmer',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    // color: Colors.amber,
                    height: ConstantUtils.getFullHeight(context) * 0.15,
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  )
                ],
              ),
              const Divider(),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  ColorUtils.logoutColors,
                ),
              ),
              onPressed: () {
                _controller.logout();
              },
              icon: Icon(
                Icons.exit_to_app,
                color: ColorUtils.whiteColors,
              ),
              label: Text(
                "Logout",
                style: TextStyle(color: ColorUtils.whiteColors),
              ),
            ),
          ),
        ),
        Obx(
          () => _controller.isLoadingLogout.value
              ? const DefaultLoadingScreenProject()
              : const SizedBox(),
        )
      ],
    ));
  }
}
