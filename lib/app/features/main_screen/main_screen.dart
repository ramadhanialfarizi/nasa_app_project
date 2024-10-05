import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/source/base_widget_container.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/color_utils.dart';
import 'package:nasa_project/app/features/main_screen/controller/main_screen_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(
      MainScreenController(),
    );
    return BaseWidgetContainer(
      body: Obx(() => _controller.widgetOptions
          .elementAt(_controller.selectedWidget.value)),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 10.0,
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
                child: Icon(
                  Icons.qr_code_scanner_outlined,
                  color: ColorUtils.whiteColors,
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
          currentIndex: _controller.selectedWidget.value,
          selectedItemColor: _controller.selectedWidget.value == 2
              ? null
              : ColorUtils.primaryColors,
          onTap: (index) {
            _controller.selectWidget(index);
          },
        ),
      ),
    );
  }
}
