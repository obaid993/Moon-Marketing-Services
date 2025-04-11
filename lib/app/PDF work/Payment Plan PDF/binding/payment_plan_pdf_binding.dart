import 'package:get/get.dart';
import 'package:moon_marketing_services/app/PDF%20work/Payment%20Plan%20PDF/controller/payment_plan_pdf_controller.dart';

class PaymentPlanPdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PaymentPlanPdfController>(PaymentPlanPdfController());
  }
}
