import 'package:get/get.dart';

import 'package:moon_marketing_services/app/theme/theme_controller.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController());
  }
}
