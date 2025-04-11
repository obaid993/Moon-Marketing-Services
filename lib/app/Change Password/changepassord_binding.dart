import 'package:get/get.dart';
import 'package:moon_marketing_services/app/Change%20Password/changepassword_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChangePasswordController>(ChangePasswordController());
  }
}
