import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/features/home_screen/controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(HomeScreenController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _controller.logout();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
