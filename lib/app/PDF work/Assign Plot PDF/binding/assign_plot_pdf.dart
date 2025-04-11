import 'package:get/get.dart';
import 'package:moon_marketing_services/app/PDF%20work/Assign%20Plot%20PDF/controller/assign_plot_pdf_controller.dart';

class AssignPlotPdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AssignPlotPdfController>(AssignPlotPdfController());
  }
}
