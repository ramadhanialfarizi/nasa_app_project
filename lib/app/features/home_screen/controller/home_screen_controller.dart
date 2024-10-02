import 'package:get/get.dart';
import 'package:nasa_project/app/features/login_screen/login_screen.dart';

class HomeScreenController extends GetxController {
  logout() {
    Get.offAll(() => const LoginScreen());
  }
}
