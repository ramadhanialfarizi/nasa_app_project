import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/cache_manager.dart';
import 'package:nasa_project/app/core/utils/log_utility.dart';
import 'package:nasa_project/app/features/login_screen/login_screen.dart';
import 'package:nasa_project/app/repository/login_repository/login_repository.dart';

class AccountScreenController extends GetxController with CacheManager {
  RxBool isLoadingLogout = false.obs;

  logout() async {
    try {
      isLoadingLogout.value = true;

      var response = await LoginRepository().logoutAccount();

      isLoadingLogout.value = false;
      if (response.isError ?? false) {
        LogUtility.writeLog(response.errorMessage);
      } else {
        setLoginStatus(false);
        Get.offAll(() => const LoginScreen());
      }
    } catch (e) {
      isLoadingLogout.value = false;
      LogUtility.writeLog("failed : $e");
    }
  }
}
