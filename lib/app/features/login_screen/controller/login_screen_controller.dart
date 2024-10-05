import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/cache_manager.dart';
import 'package:nasa_project/app/core/utils/log_utility.dart';
import 'package:nasa_project/app/features/main_screen/main_screen.dart';
import 'package:nasa_project/app/repository/login_repository/login_repository.dart';

class LoginScreenController extends GetxController with CacheManager {
  RxBool isLoadingLogin = false.obs;

  signInWithGoogle() async {
    try {
      isLoadingLogin.value = true;

      var response = await LoginRepository().loginWithGoogle();

      isLoadingLogin.value = false;
      if (response.isError ?? false) {
        LogUtility.writeLog(response.errorMessage);
      } else {
        setLoginStatus(true);
        Get.offAll(() => const MainScreen());
      }
    } catch (e) {
      isLoadingLogin.value = false;
      LogUtility.writeLog("failed : $e");
    }
  }
}
