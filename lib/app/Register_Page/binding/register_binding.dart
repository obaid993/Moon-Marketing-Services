import 'package:get/get.dart';
import 'package:moon_marketing_services/app/Register_Page/Controller/register_controller.dart';

class RegisterScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterScreenController>(RegisterScreenController());
  }
}
