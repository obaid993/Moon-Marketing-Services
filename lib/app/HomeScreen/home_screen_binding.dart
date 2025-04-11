import 'package:get/get.dart';
import 'package:moon_marketing_services/app/HomeScreen/home_screen_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeScreenController>(HomeScreenController());
  }
}
