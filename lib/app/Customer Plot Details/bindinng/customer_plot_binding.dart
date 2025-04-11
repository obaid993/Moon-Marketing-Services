import 'package:get/get.dart';
import 'package:moon_marketing_services/app/Customer%20Plot%20Details/controllers/coustomer_plot_details.dart';

class CustomerPlotBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CustomerPlotController>(CustomerPlotController());
  }
}
