import 'package:get/get.dart';
import 'package:moon_marketing_services/app/HomePage/controller/homepage_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomePageController>(HomePageController());
  }
}
