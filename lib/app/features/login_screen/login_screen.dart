import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/features/login_screen/controller/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(LoginScreenController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _controller.signInWithGoogle();
          },
          child: const Text('Login with Google'),
        ),
      ),
    );
  }
}
