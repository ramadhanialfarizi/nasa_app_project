import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/log_utility.dart';
import 'package:nasa_project/app/features/home_screen/home_screen.dart';
import 'package:nasa_project/app/repository/login_repository.dart/login_repository.dart';

class LoginScreenController extends GetxController {
  RxBool isLoadingLogin = false.obs;

  signInWithGoogle() async {
    try {
      isLoadingLogin.value = true;

      var response = await LoginRepository().loginWithGoogle();

      isLoadingLogin.value = false;
      if (response.isError ?? false) {
        LogUtility.writeLog(response.errorMessage);
      } else {
        Get.offAll(() => const HomeScreen());
      }
    } catch (e) {
      isLoadingLogin.value = false;
      LogUtility.writeLog("failed : $e");
    }
  }
}
