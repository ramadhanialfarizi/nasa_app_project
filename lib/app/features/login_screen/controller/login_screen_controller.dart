import 'package:get/get.dart';
import 'package:nasa_project/app/features/home_screen/home_screen.dart';

class LoginScreenController extends GetxController {
  signInWithGoogle() {
    Get.offAll(() => const HomeScreen());
  }
}
