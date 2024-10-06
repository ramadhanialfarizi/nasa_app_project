import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nasa_project/app/core/utils/cache_manager.dart';
import 'package:nasa_project/app/core/utils/log_utility.dart';
import 'package:nasa_project/app/features/ar/annotation.dart';
import 'package:nasa_project/app/features/login_screen/login_screen.dart';
import 'package:nasa_project/app/repository/data_model/soil_dm.dart';
import 'package:nasa_project/app/repository/login_repository/login_repository.dart';

class HomeScreenController extends GetxController with CacheManager {
  RxBool isLoadingLogin = false.obs;
  RxBool isLoadingSoilHistory = true.obs;
  RxList<SoilDM> listSoilInfos = <SoilDM>[].obs;
  CollectionReference scans = FirebaseFirestore.instance.collection('scans');

  Future<void> getListSoilHistory() async {
    isLoadingSoilHistory.value = true;
    try {
      scans.get().then((snapshot) {
        List<SoilDM> listSoilDM = [];
        if (snapshot.docs.isNotEmpty) {
          for (var doc in snapshot.docs) {
            try {
              Annotation item = doc as Annotation;
              listSoilDM.add(item.soilDM ?? SoilDM());
            } catch (e) {
              LogUtility.writeLog('error stream: ${e.toString()}');
            }
          }
        }
        if (listSoilDM.isNotEmpty) {
          listSoilInfos.clear();
          listSoilInfos.value = listSoilDM;
        }
      });
    } catch (e) {
      LogUtility.writeLog(e.toString());
    }
    isLoadingSoilHistory.value = false;
  }

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

  @override
  void onInit() {
    getListSoilHistory();
    super.onInit();
  }
}
