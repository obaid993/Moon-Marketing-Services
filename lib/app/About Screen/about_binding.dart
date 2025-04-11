
import 'package:get/get.dart';
import 'package:moon_marketing_services/app/About%20Screen/about_controller.dart';

class AboutScreenBinding extends Bindings {

  @override
  void dependencies(){
    Get.put<AboutScreenController>(AboutScreenController());
  }
}