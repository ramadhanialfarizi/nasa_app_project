import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/cache_manager.dart';
import 'package:nasa_project/app/features/login_screen/login_screen.dart';

class SplashScreenController extends GetxController with CacheManager {
  @override
  void onInit() async {
    super.onInit();
    // splasScreenStart();
  }

  splasScreenStart() async {
    bool loginStatus = await getLoginStatus();
    await Future.delayed(const Duration(seconds: 1));

    if (loginStatus) {
      // Get.offAll(() => const ());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }
}
