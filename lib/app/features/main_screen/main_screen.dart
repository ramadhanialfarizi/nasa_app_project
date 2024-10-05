import 'package:flutter/material.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/features/main_screen/controller/main_screen_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(
      MainScreenController(),
    );
    return BaseWidgetContainer(
      body: Obx(() =>
          controller.widgetOptions.elementAt(controller.selectedWidget.value)),
      bottomNavigationBar: Obx(
        () => controller.selectedWidget.value == 2
            ? const SizedBox()
            : BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: [
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_basket_rounded),
                    label: 'Market',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorUtils.primaryColors,
                      ),
                      child: const Icon(
                        Icons.qr_code_scanner_outlined,
                      ),
                    ),
                    label: '',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.map),
                    label: 'Location',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.people_alt),
                    label: 'Account',
                  ),
                ],
                currentIndex: controller.selectedWidget.value,
                selectedItemColor: controller.selectedWidget.value == 2
                    ? null
                    : ColorUtils.primaryColors,
                onTap: (index) {
                  controller.selectWidget(index);
                },
              ),
      ),
    );
  }
}
