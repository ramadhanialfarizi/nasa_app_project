import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/features/account_screen/account_screen.dart';
import 'package:nasa_project/app/features/ar/ar_screen.dart';
import 'package:nasa_project/app/features/home_screen/home_screen.dart';
import 'package:nasa_project/app/features/maps_screen/map_screen.dart';
import 'package:nasa_project/app/features/market_screen/market_screen.dart';

class MainScreenController extends GetxController {
  RxInt selectedWidget = 0.obs;

  List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const MarketScreen(),
    const ArScreen(),
    Container(),
    const AccountScreen(),
  ];

  selectWidget(int index) {
    if (index == 2) {
    } else if (index == 3) {
      Get.to(() => const MapScreen());
    } else {
      selectedWidget.value = index;
    }
  }
}
