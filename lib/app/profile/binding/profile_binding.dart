import 'package:get/get.dart';
import 'package:moon_marketing_services/app/profile/controller/profile_controller.dart';

class ProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileScreenController>(ProfileScreenController());
  }
}
