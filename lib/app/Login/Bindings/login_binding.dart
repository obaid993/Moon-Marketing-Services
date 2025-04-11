import 'package:get/get.dart';
import 'package:moon_marketing_services/app/Login/controller/login_controller.dart';

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginScreenController>(LoginScreenController());
  }
}
