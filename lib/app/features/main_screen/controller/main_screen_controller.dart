import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/features/home_screen/home_screen.dart';

class MainScreenController extends GetxController {
  RxInt selectedWidget = 0.obs;

  List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  selectWidget(int index) {
    if (index == 2) {
    } else {
      selectedWidget.value = index;
    }
  }
}
