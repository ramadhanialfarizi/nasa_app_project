import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/features/account_screen/controller/account_screen_controller.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(AccountScreenController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
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
