import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/cache_manager.dart';
import 'package:nasa_project/app/core/utils/log_utility.dart';
import 'package:nasa_project/app/features/login_screen/login_screen.dart';
import 'package:nasa_project/app/repository/login_repository/login_repository.dart';

class HomeScreenController extends GetxController with CacheManager {
  RxBool isLoadingLogin = false.obs;

  logout() async {
    try {
      isLoadingLogin.value = true;

      var response = await LoginRepository().logoutAccount();

      isLoadingLogin.value = false;
      if (response.isError ?? false) {
        LogUtility.writeLog(response.errorMessage);
      } else {
        setLoginStatus(false);
        Get.offAll(() => const LoginScreen());
      }
    } catch (e) {
      isLoadingLogin.value = false;
      LogUtility.writeLog("failed : $e");
    }
  }
}
