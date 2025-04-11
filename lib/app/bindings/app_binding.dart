// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:moon_marketing_services/app/Customer%20Plot%20Details/controllers/coustomer_plot_details.dart';
import 'package:moon_marketing_services/app/HomeScreen/home_screen_controller.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/controller/get_account_details.controller.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/controller/payment_plan_pdf_controller.dart';
import 'package:moon_marketing_services/app/profile/controller/profile_controller.dart';
import 'package:moon_marketing_services/app/theme/theme_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<ProfileScreenController>(() => ProfileScreenController());
    //Get.lazyPut<LoginScreenController>(() => LoginScreenController());
    Get.lazyPut<CustomerPlotController>(() => CustomerPlotController());

    Get.lazyPut<ProfileScreenController>(() => ProfileScreenController());
    Get.lazyPut<PaymentPlanPdfController>(() => PaymentPlanPdfController());
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());

    // Get.lazyPut<AccountDetailsControllers>(
    //   () => AccountDetailsControllers(),
    // );

    Get.put<ThemeController>(ThemeController());
  }
}
