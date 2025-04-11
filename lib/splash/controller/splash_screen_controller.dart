import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

import 'package:moon_marketing_services/page_and_routes/app_pages.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();

  @override
  void onReady() {
    super.onReady();

    if (getStorage.read('islogin') != null && getStorage.read("islogin")) {
      Future.delayed(const Duration(milliseconds: 3000),
          () => Get.offAllNamed(Routes.HOMEPAGE));
    } else {
      Future.delayed(const Duration(milliseconds: 3000),
          () => Get.offAllNamed(Routes.LOGIN));
    }
  }
}
